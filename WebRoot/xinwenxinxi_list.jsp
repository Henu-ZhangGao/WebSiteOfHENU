<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>

<div style="padding: 10px" class="admin-content">
<%
//------------------------------------------------
String orderby = util.Request.get("order" , "id");  // 获取搜索框中的排序字段、默认为发布时间
String sort  = util.Request.get("sort" , "desc");   // 获取搜索框中的排序类型、默认为倒序

String where = " 1=1 ";   // 防止sql 搜索条件为： where and a=b 这样的错误



// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中



             if(request.getParameter("biaoti") != null && !"".equals( request.getParameter("biaoti") )){ where+=" AND biaoti LIKE '%"+request.getParameter("biaoti")+"%'"; } 
                     if(request.getParameter("fenlei") != null && !"".equals( request.getParameter("fenlei") )){ 
where+=" AND fenlei ='"+request.getParameter("fenlei")+"'"; } 
                         if(request.getParameter("tianjiaren") != null && !"".equals( request.getParameter("tianjiaren") )){ where+=" AND tianjiaren LIKE '%"+request.getParameter("tianjiaren")+"%'"; } 
                     if(request.getParameter("dianjilv_start") != null && !"".equals( request.getParameter("dianjilv_start") )){ where+= " AND dianjilv >='"+request.getParameter("dianjilv_start")+"' "; }      
 if(request.getParameter("dianjilv_end") != null && !"".equals( request.getParameter("dianjilv_end") )){ where+= " AND dianjilv <='"+request.getParameter("dianjilv_end")+"' "; }                     if(request.getParameter("neirong") != null && !"".equals( request.getParameter("neirong") )){ where+=" AND neirong LIKE '%"+request.getParameter("neirong")+"%'"; } 
            
List<HashMap> list = Query.make("xinwenxinxi").where(where).order(orderby+" "+sort).page(15);

        %>






<div class="panel panel-default">
    <div class="panel-heading">
        <span class="module-name">
            新闻信息        </span>
        <span>列表</span>
    </div>
    <div class="panel-body">
        <div class="pa10 bg-warning">
            <form class="form-inline" id="formSearch" action="?"><!-- form 标签开始 -->
    
                <div class="form-group">
    
    
                    <i class="glyphicon glyphicon-search"></i>
                
</div>
                                
                                                            <div class="form-group">
    标题
    
                            <input type="text" class="form-control" style="" name="biaoti" value="<%= request.getParameter("biaoti") !=null ? request.getParameter("biaoti") : "" %>"/>                        
</div>
                                                                <div class="form-group">
    分类
    
                            <select class="form-control class_fenlei6" data-value="<%= request.getParameter("fenlei") !=null ? request.getParameter("fenlei") : "" %>" data-rule-required="true" data-msg-required="请填写分类" id="fenlei" name="fenlei">
<option value="">请选择</option><% 
 List<HashMap> select = new CommDAO().select("SELECT * FROM xinwenfenlei ORDER BY id desc"); 
 %>
<%  for(HashMap m:select){  %>
<option value="<%= m.get("id") %>"><%= m.get("fenleimingcheng") %></option>
<% } %>

</select>
<script>
$(".class_fenlei6").val($(".class_fenlei6").attr("data-value"))</script>
                        
</div>
                                                                                    <div class="form-group">
    添加人
    
                            <input type="text" class="form-control" style="" name="tianjiaren" value="<%= request.getParameter("tianjiaren") !=null ? request.getParameter("tianjiaren") : "" %>"/>                        
</div>
                                                                <div class="form-group">
    点击率
    
                            <input type="text" class="form-control" style="width:80px;" name="dianjilv_start" value="<%= request.getParameter("dianjilv_start") !=null ? request.getParameter("dianjilv_start") : "" %>"/>-
<input type="text" class="form-control" style="width:80px;" name="dianjilv_end" value="<%= request.getParameter("dianjilv_end") !=null ? request.getParameter("dianjilv_end") : "" %>"/>                        
</div>
                                                                <div class="form-group">
    内容
    
                                                    
</div>
                                                        <select class="form-control" name="order" id="orderby">

                    <option value="id">按发布时间</option>
                                    
</select>
                <select class="form-control" name="sort" id="sort">

                    <option value="desc">倒序</option>
                    <option value="asc">升序</option>
                
</select>
                <script>$("#orderby").val("<%= orderby %>");$("#sort").val("<%= sort %>");</script>
                <button type="submit" class="btn btn-default">
    搜索
</button>

                
            
<!--form标签结束--></form>
        </div>



        
                    <div class="list-table">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                    <tr align="center">
                        <th width="60" data-field="item">序号</th>
                        <th> 标题  </th>
<th> 分类  </th>
<th> 图片  </th>
<th> 添加人  </th>
<th> 点击率  </th>
<th> 添加时间  </th>
                                                                        <th width="220" data-field="handler">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% 
                int i= 0;
                for(HashMap map:list){
                i++;
                 %>
                    <tr id="<%= map.get("id") %>" pid="">
                        <td width="30" align="center">
                            <label>
                                                                <%= i %>
                            </label>
                        </td>
                        <td> <%= map.get("biaoti") %> </td>
<td> <% 
 HashMap mapxinwenfenlei2 = new CommDAO().find("SELECT fenleimingcheng FROM xinwenfenlei where id='"+map.get("fenlei")+"'"); 
 %><%= mapxinwenfenlei2.get("fenleimingcheng") %> </td>
<td> <% if( "".equals( map.get("tupian") ) ){ %>-<% } else { %><img width="100" src="<%= map.get("tupian") %>"/><% } %> </td>
<td> <%= map.get("tianjiaren") %> </td>
<td> <%= map.get("dianjilv") %> </td>
<td> <%= Info.subStr(map.get("addtime") , 19 , "") %> </td>
                                                                        <td align="center">

                            
                                                        
                            
                                                                <a href="xinwenxinxi_detail.jsp?id=<%= map.get("id") %>">详情</a>
                                                                <a href="xinwenxinxi_updt.jsp?id=<%= map.get("id") %>">编辑</a>
                                                                <a href="xinwenxinxi.jsp?a=delete&id=<%= map.get("id") %>" onclick="return confirm('确定要删除？')">删除</a>
                                                        <!--qiatnalijne-->
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
            
        ${page.info}
            </div>



</div>








</div>
<%@ include file="foot.jsp" %>

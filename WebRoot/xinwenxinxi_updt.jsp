<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>
<link rel="stylesheet" href="js/layer/theme/default/layer.css"/>
<script src="js/layer/layer.js"></script>
<link rel="stylesheet" href="js/umeditor/themes/default/css/umeditor.css"/>
<script src="js/umeditor/umeditor.config.js"></script>
<script src="js/umeditor/umeditor.min.js"></script>

<div style="padding: 10px" class="admin-content">


    <% if( request.getSession().getAttribute("username") == null || "".equals( request.getSession().getAttribute("username") ) ){ %>
    <script>
        alert('对不起,请您先登陆!');
        location.href='login.jsp';
    </script>
    <%
        return;
    } %>


<%
        // 获取需要编辑的数据
    String updtself="0"; // 设置更新
    HashMap mmm = new CommDAO().getmap(request.getParameter("id") , "xinwenxinxi");
    %>








<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

    <div class="panel panel-default">
        <div class="panel-heading">
            编辑新闻信息:
        </div>
        <div class="panel-body">
            <form action="xinwenxinxi.jsp?a=update" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">标题<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                                                    <input type="text" class="form-control" placeholder="输入标题" style="width:250px;" data-rule-required="true" data-msg-required="请填写标题" remote="factory/checkno.jsp?checktype=update&id=<%= mmm.get("id") %>&table=xinwenxinxi&col=biaoti" data-msg-remote="内容重复了" id="biaoti" name="biaoti" value="<%= Info.html(mmm.get("biaoti")) %>"/>                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">分类<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                                                    <select class="form-control class_fenlei9" data-value="<%= Info.html(mmm.get("fenlei")) %>" data-rule-required="true" data-msg-required="请填写分类" id="fenlei" name="fenlei" style="width:250px">
<% 
 List<HashMap> select = new CommDAO().select("SELECT * FROM xinwenfenlei ORDER BY id desc"); 
 %>
<%  for(HashMap m:select){  %>
<option value="<%= m.get("id") %>"><%= m.get("fenleimingcheng") %></option>
<% } %>

</select>
<script>
$(".class_fenlei9").val($(".class_fenlei9").attr("data-value"))</script>
                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">图片</label>
        <div class="col-sm-10">
            
                                                    <div class="input-group" style="width:250px">
    <input type="text" class="form-control" id="tupian" name="tupian" value="<%= Info.html(mmm.get("tupian")) %>"/>

    <span class="input-group-btn"><button type="button" class="btn btn-default" onclick="layer.open({type:2,title:'上传图片',fixed:true,shadeClose:true,shade:0.5,area:['320px','150px'],content:'upload.html?result=tupian'})">
    上传图片
</button></span>
</div>                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">添加人</label>
        <div class="col-sm-10">
            
                                                    <input type="text" class="form-control" placeholder="输入添加人" style="width:150px;" readonly="readonly" id="tianjiaren" name="tianjiaren" value="<%= mmm.get("tianjiaren") %>"/>                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">点击率</label>
        <div class="col-sm-10">
            
                                                    <input type="number" class="form-control" placeholder="输入点击率" style="width:150px;" number="true" data-msg-number="输入一个有效数字" id="dianjilv" name="dianjilv" value="<%= Info.html(mmm.get("dianjilv")) %>"/>                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">内容</label>
        <div class="col-sm-10">
            
                                                    <textarea id="neirong" name="neirong" style="max-width: 750px;width:100%; height: 300px;"><%= Info.html(mmm.get("neirong")) %></textarea><script>
            (function(){
                var um = UM.getEditor('neirong');
            })();
            </script>                                            
        </div>
        
    </div>
</div>
                                                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
        <div class="col-sm-10">
            
                                            <input name="id" value="<%= mmm.get("id") %>" type="hidden"/>
                        <input name="referer" value="<%=request.getHeader("referer")%>" type="hidden"/>
                        <input name="updtself" value="<%= updtself %>" type="hidden"/>
                                        
                    
                    <button type="submit" class="btn btn-primary" name="Submit">
    提交
</button>
                    <button type="reset" class="btn btn-default" name="Submit2">
    重置
</button>

                
        </div>
        
    </div>
</div>
            
<!--form标签结束--></form>
        </div>
    </div>

<!-- container定宽，并剧中结束 --></div>





<script>
    $(function () {
        $('#form1').validate();
    });
</script>



</div>
<%@ include file="foot.jsp" %>

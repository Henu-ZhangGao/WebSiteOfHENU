<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>

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
    HashMap mmm = new CommDAO().getmap(request.getParameter("id") , "pinglunhuifu");
    %>








<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

    <div class="panel panel-default">
        <div class="panel-heading">
            编辑评论回复:
        </div>
        <div class="panel-body">
            <form action="pinglunhuifu.jsp?a=update" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                                    <input type="hidden" name="pinglunid" value="<%= mmm.get("pinglunid") %>"/>                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">表<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                                                    <%= mmm.get("biao") %><input type="hidden" id="biao" name="biao" value="<%= Info.html(mmm.get("biao")) %>"/>                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">表id<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                                                    <%= mmm.get("biaoid") %><input type="hidden" id="biaoid" name="biaoid" value="<%= Info.html(mmm.get("biaoid")) %>"/>                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">标题<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                                                    <%= mmm.get("biaoti") %><input type="hidden" id="biaoti" name="biaoti" value="<%= Info.html(mmm.get("biaoti")) %>"/>                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">评论内容</label>
        <div class="col-sm-10">
            
                                                    <%= mmm.get("pinglunneirong") %><input type="hidden" id="pinglunneirong" name="pinglunneirong" value="<%= Info.html(mmm.get("pinglunneirong")) %>"/>                                            
        </div>
        
    </div>
</div>
                                                                            <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">回复内容</label>
        <div class="col-sm-10">
            
                                                    <textarea style="width: 80%;height: 120px" class="form-control" placeholder="输入回复内容" id="huifuneirong" name="huifuneirong"><%= Info.html(mmm.get("huifuneirong")) %></textarea>                                            
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

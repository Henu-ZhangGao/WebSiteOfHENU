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



    
    <% if( null == request.getParameter("id") || "".equals( request.getParameter("id") ) ){ %>        <script>
            alert('非法操作');
            history.go(-1);
        </script>
    <% out.close(); %>
    <% } %>        <% HashMap readMap = Query.make("pinglun").where("id", request.getParameter("id")).find(); %>





<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

    <div class="panel panel-default">
        <div class="panel-heading">
            添加评论回复:
        </div>
        <div class="panel-body">
            <form action="pinglunhuifu.jsp?a=insert" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                                    <input type="hidden" name="pinglunid" value="<%= request.getParameter("id") !=null ? request.getParameter("id") : "" %>"/>                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">表<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                                                    <%= readMap.get("biao") %><input type="hidden" id="biao" name="biao" value="<%= Info.html(readMap.get("biao")) %>"/>                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">表id<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                                                    <%= readMap.get("biaoid") %><input type="hidden" id="biaoid" name="biaoid" value="<%= Info.html(readMap.get("biaoid")) %>"/>                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">标题<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                                                    <%= readMap.get("biaoti") %><input type="hidden" id="biaoti" name="biaoti" value="<%= Info.html(readMap.get("biaoti")) %>"/>                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">评论内容</label>
        <div class="col-sm-10">
            
                                                    <%= readMap.get("pinglunneirong") %><input type="hidden" id="pinglunneirong" name="pinglunneirong" value="<%= Info.html(readMap.get("pinglunneirong")) %>"/>                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">评论人</label>
        <div class="col-sm-10">
            
                                                    <%= readMap.get("pinglunren") %><input type="hidden" id="pinglunren" name="pinglunren" value="<%= Info.html(readMap.get("pinglunren")) %>"/>                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">回复内容</label>
        <div class="col-sm-10">
            
                                                    <textarea style="width: 80%;height: 120px" class="form-control" placeholder="输入回复内容" id="huifuneirong" name="huifuneirong"></textarea>                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">回复人</label>
        <div class="col-sm-10">
            
                                                    <input type="text" class="form-control" placeholder="输入回复人" style="width:150px;" readonly="readonly" id="huifuren" name="huifuren" value="<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>"/>                                            
        </div>
        
    </div>
</div>
                                                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
        <div class="col-sm-10">
            
                                                                <input name="referer" value="<%=request.getHeader("referer")%>" type="hidden"/>
                    
                                                                                                                
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

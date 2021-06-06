<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>


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


<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>



<div style="margin:20px 0 0 0">

    

<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

                    

    

<div class="title-modelbox-widget">
        <h3 class="section-title">
                        <div class="more">
                <a href="xinwenxinxilist.jsp">更多>></a>
            </div>
                        新闻信息        </h3>
        <div class="sidebar-widget-body">
            


    

<div class="">
                            <div style="margin-bottom: 20px">
                

    

<form action="?" class="search">
                <table class="jd-search">
            <tbody>
                        <tr>
                <td class="label1">
                    标题                </td>
                <td class="form-inline">
                                        <input type="text" class="form-control" style="width: 150px" name="biaoti" value="<%= request.getParameter("biaoti") !=null ? request.getParameter("biaoti") : "" %>" placeholder="请输入关键词"/>
                                                <button type="submit" class="btn btn-default">
    搜索
</button>
                                                                                    </td>
            </tr>

                                    <tr>
                <td class="label1">
                    分类                </td>
                <td class="form-inline">
                                            <p class="search-radio">
                        <input type="hidden" name="fenlei" value="<%= request.getParameter("fenlei") !=null ? request.getParameter("fenlei") : "" %>"/>
                        <a href="javascript:;" data-value="" onclick="selectRadio(this)">全部</a>
                                                <% 
 List<HashMap> mapxinwenfenlei4 = new CommDAO().select("SELECT id,fenleimingcheng FROM xinwenfenlei"); 
 %>                    <%  for(HashMap r:mapxinwenfenlei4){  %>
                        <a href="javascript:;" data-value="<%= r.get("id") %>" onclick="selectRadio(this)"><%= r.get("fenleimingcheng") %></a>
                        <% } %>
                                            </p>
                                    </td>
            </tr>

                        
            </tbody>
        </table>
    </form>



            </div>
                <div class="news-list">
            <ul>
                <%  for(HashMap r:list){  %>
                <li class="clearfix">
                                        <a href="xinwenxinxidetail.jsp?id=<%= r.get("id") %>">
                    <div class="thumb">
                        <div class="img-box pb100">
                            <div class="img" style="background-image: url('<%= r.get("tupian") %>')"></div>
                        </div>
                    </div>
                    </a>
                    
                    <div class="news-content-text ">
                        <a href="xinwenxinxidetail.jsp?id=<%= r.get("id") %>">
                            <h3><%= r.get("biaoti") %></h3>
                        </a>
                                                <div class="description">
                            <%= Info.subStr(r.get("neirong"), 80) %>
                        </div>
                                                                        <div class="other-content">
                                                        <span>添加人：<%= r.get("tianjiaren") %></span>
                                                        <span>点击率：<%= r.get("dianjilv") %></span>
                                                        <span>分类：<% 
 HashMap mapxinwenfenlei5 = new CommDAO().find("SELECT fenleimingcheng FROM xinwenfenlei where id='"+r.get("fenlei")+"'"); 
 %><%= mapxinwenfenlei5.get("fenleimingcheng") %></span>
                                                    </div>
                                            </div>
                </li>
                <% } %>
            </ul>
        </div>
                ${page.info}
            </div>




        </div>
        <!-- /.sidebar-widget-body -->
    </div>



        
    
<!-- container定宽，并剧中结束 --></div>



</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>
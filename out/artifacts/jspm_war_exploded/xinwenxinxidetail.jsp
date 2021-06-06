<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%
    new CommDAO().commOper("UPDATE xinwenxinxi SET dianjilv=dianjilv+1 WHERE id=" + request.getParameter("id") + "");

%>
<% HashMap map = Query.make("xinwenxinxi").where("id", request.getParameter("id")).find(); %>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>


<div>


    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->


        <div class="title-modelbox-widget">
            <h3 class="section-title">
                新闻详情 </h3>
            <div class="sidebar-widget-body">


                <div class="news-info">
                    <h3 class="title">
                        <%= map.get("biaoti") %>
                    </h3>
                    <div class="descount">
                            <span class="title">
                分类：
                <%
                    HashMap mapxinwenfenlei8 = new CommDAO().find("SELECT fenleimingcheng FROM xinwenfenlei where id='" + map.get("fenlei") + "'");
                %><%= mapxinwenfenlei8.get("fenleimingcheng") %>            </span>
                        <span class="title">
                点击率：
                <%= map.get("dianjilv") %>            </span>
                        <span class="title">
                添加人：
                <%= map.get("tianjiaren") %>            </span>
                    </div>
                    <div class="content">
                        <%= map.get("neirong") %>
                    </div>
                </div>


            </div>
            <!-- /.sidebar-widget-body -->
        </div>


        <div class="title-modelbox-widget">
            <h3 class="section-title">
                在线评论 </h3>
            <div class="sidebar-widget-body">


                <div class="gr-control-module-table">
                    <div class="">
                        <form action="pinglun.jsp?a=insert" method="post"><!-- form 标签开始 -->

                            <div class="form-group" style="display: none">
                                <div class="row">
                                    <label style="text-align: right" class="col-sm-2 hiddex-xs">评分</label>
                                    <div class="col-sm-10">

                                        <select class="form-control" name="pingfen">

                                            <option value="1">1分</option>
                                            <option value="2">2分</option>
                                            <option value="3">3分</option>
                                            <option value="4">4分</option>
                                            <option value="5">5分</option>

                                        </select>

                                    </div>

                                </div>
                            </div>
                            <div class="form-group">


                                <textarea style="width: 80%;height: 120px" class="form-control" name="pinglunneirong"
                                          placeholder="请输入评论内容"></textarea>

                            </div>
                            <input type="hidden" name="biao" value="xinwenxinxi"/>
                            <input name="biaoid" type="hidden" id="biaoid"
                                   value="<%= request.getParameter("id") !=null ? request.getParameter("id") : "" %>"/>
                            <input name="biaoti" type="hidden" id="biaoti" value="<%= map.get("biaoti") %>"/>
                            <input name="pinglunren" type="hidden"
                                   value="<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>"/>
                            <div style="text-align: left">
                                <% if ( session.getAttribute("username") !=null ) { %>
                                <button type="submit" class="btn btn-primary">
                                    发布评论
                                </button>
                                <% }  else { %>
                                <button type="button" onclick="alert('您尚未登陆无法操作！')" class="btn btn-primary">
                                    发布评论
                                </button>


                                <% } %>

                                <button type="button" class="btn btn-default"
                                        onclick="location.href='jrsc.jsp?id=<%= map.get("id") %>&biao=xinwenxinxi&ziduan=biaoti'">
                                    收藏
                                </button>
                            </div>

                            <!--form标签结束--></form>
                    </div>

                    <% ArrayList<HashMap> pinglunList = Query.make("pinglun").where("biao", "xinwenxinxi").where("biaoid", request.getParameter("id")).order("id desc").select(); %>

                    <div class="mt10">
                        <% for (HashMap pl : pinglunList) { %>
                        <% HashMap user = Query.make("yonghu").where("yonghuming", pl.get("pinglunren")).find(); %>

                        <div class="comment clearfix">
                            <div class="common-avatar J_User">
                                <% if (user.get("touxiang") == null || "".equals(user.get("touxiang"))) { %>
                                <img src="images/default.gif" width="100%" height="100%"/>
                                <% } else { %>
                                <img src="<%= user.get("touxiang") %>" width="100%" height="100%"/>
                                <% } %>
                            </div>
                            <div class="comment-block">
                                <p class="comment-user">
                                    <span class="comment-username J_User"> <%= user.get("xingming") %> </span>
                                    <span class="comment-time"><%= pl.get("addtime") %></span>

                                    <a href="pinglunhuifuadd.jsp?id=<%= pl.get("id") %>">回复</a>
                                </p>
                                <div class="comment-content J_CommentContent"><%= pl.get("pinglunneirong") %>
                                </div>

                                <%
                                    ArrayList<HashMap> huifuList = Query.make("pinglunhuifu").where("pinglunid", pl.get("id")).order("id desc").select(); %>

                                <div class="reply J_ReplyBlock">
                                    <% for (HashMap hf : huifuList) { %>
                                    <div class="reply-block">
                                        <div class="reply-content">
                                            <span class="reply-user">
                                                <b class="reply-user-nick J_User"
                                                   data-userid="120161158"><%= hf.get("huifuren") %></b>  : </span>
                                            <%= hf.get("huifuneirong") %>
                                        </div>
                                        <div class="reply-operate reply-operate--hot">
                                            <i class="reply-dot">·</i>
                                            <span><%= hf.get("addtime") %></span>
                                        </div>
                                    </div>
                                    <% } %>

                                </div>

                            </div>
                        </div>
                        <% } %>
                    </div>

                </div>


            </div>
            <!-- /.sidebar-widget-body -->
        </div>


        <!-- container定宽，并剧中结束 --></div>


</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>
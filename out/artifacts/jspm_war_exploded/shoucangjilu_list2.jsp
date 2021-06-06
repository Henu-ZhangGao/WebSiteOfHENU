<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>

<%@ include file="head.jsp" %>



<div style="padding: 10px">
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="module-name">
            我的收藏
            </span>
        </div>
        <div class="panel-body">
            <div class="list-table">
                <table class="table table-hover">
                    <tr>
                        <td width="25">序号</td>
                        <td>标题</td>
                        <td width="200" align="center">收藏时间</td>
                        <td width="75" align="center">操作</td>
                    </tr>
                    <%
                        new CommDAO().delete(request, "shoucangjilu");
                        List<HashMap> list =Query.make("shoucangjilu").where("username" , session.getAttribute("username")).page(20);
                        int i = 0;
                        for (HashMap map : list) {
                            i++;
                    %>
                    <tr>
                        <td width="25"><%=i %>
                        </td>
                        <td><%= map.get("biaoti") %></td>
                        <td width="135" align="center"><%=map.get("addtime")%>
                        </td>
                        <td width="75" align="center">
                            <a href="shoucangjilu_list2.jsp?id=<%=map.get("id")%>" onclick="return confirm('真的要删除？')">删除</a>
                            <a href="<%=map.get("biao")%>detail.jsp?id=<%=map.get("xwid")%>" target="_blank">详细</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>

            ${page.info}
        </div>


    </div>


</div>


<%@ include file="foot.jsp" %>


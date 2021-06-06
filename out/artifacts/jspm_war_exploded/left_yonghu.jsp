<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<li class="sidebar-list-item">
    <a href="javascript:;" data-toggle="collapse" data-target="#pages0" aria-expanded="false" aria-controls="pages"
       class="sidebar-link text-muted">
        <span>个人中心</span>
    </a>
    <div id="pages0" class="collapse">
        <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
            <li class="sidebar-list-item"><a href="yonghu_updtself.jsp" target="main"
                                             class="sidebar-link text-muted pl-lg-5">修改个人资料</a>
            </li>
            <li class="sidebar-list-item"><a href="mod.jsp" target="main"
                                             class="sidebar-link text-muted pl-lg-5">修改密码</a>
            </li>
            <li class="sidebar-list-item"><a href="shoucangjilu_list2.jsp" target="main"
                                             class="sidebar-link text-muted pl-lg-5">我的收藏</a>
            </li>
        </ul>
    </div>
</li>

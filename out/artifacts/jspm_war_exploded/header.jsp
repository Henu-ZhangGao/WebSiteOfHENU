<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>


<header><meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
        <div class="header-mobile">
            <div class="header-mobile-box">
                <div class="fr">
                    <% if( request.getSession().getAttribute("username") != null && !(request.getSession().getAttribute("username").equals( "" )) ){ %>
                    <div class="dropdown" style="display: inline-block">
    <a href="javascript:;" class="dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>
        <span class="caret"></span>
    </a>
    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
        
                        <li href="main.jsp"><a href="main.jsp">个人中心</a></li>
                        <li href="logout.jsp" onclick="return confirm('你确定退出？')"><a href="logout.jsp" onclick="return confirm('你确定退出？')">退出</a></li>
                    
    </ul>
    
</div>
                    <% } else { %>
                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#loginModel">
    登录
</button>
                                        <% } %>
                    <button class="btn btn-primary btn-sm" onclick="$('.main_header').toggleClass('open')">
                        <i class="fa fa-bars"></i>
                    </button>
                </div>
                <a href="./">新闻网站</a>
            </div>
        </div>


        <div class="main_header sticky-header" onclick="$('.main_header').toggleClass('open')">
            <div class="container-fluid">
                <div class="header_container">
                    <div class="row align-items-center">
    
                        <div class="col-lg-2 hidden-xs">
    
                            <div class="logo">
                                <a href="./">新闻网站</a>
                            </div>
                        
</div>
                        <div class="col-lg-8">
    
                            <!--main menu start-->
                            <div class="main_menu menu_position">
                                <nav>
                                    <ul id="navbar-str">
                                        <!-- 前端导航 -->
                                        <li>
<a href="./">主页
</a>
</li>
<li>
<a href="xinwenxinxilist.jsp">新闻资讯
<i class="fa fa-angle-down"></i>
</a>

<ul class="sub_menu">
                    <% 
 List<HashMap> mapxinwenfenlei1 = new CommDAO().select("SELECT id,fenleimingcheng FROM xinwenfenlei"); 
 %>
<%  for(HashMap m:mapxinwenfenlei1){  %>
<li><a href="xinwenxinxilist.jsp?fenlei=<%= m.get("id") %>"><%= m.get("fenleimingcheng") %></a></li>
<% } %>
</ul>
</li>
<li>
<a href="yonghuadd.jsp">在线注册
</a>
</li>
<li>
<a href="liuyanbanadd.jsp">留言反馈
</a>
</li>
<li>
<a href="login.jsp">后台管理
</a>
</li>                                        <!-- 前端导航结束 -->
                                    </ul>
                                </nav>
                            </div>
                            <!--main menu end-->
                        
</div>
                        <div class="col-lg-2 hidden-xs">
    
                            <div class="header_account_area">
                                <div class="header_account-list user-info">
                                    <% if( request.getSession().getAttribute("username") != null && !(request.getSession().getAttribute("username").equals( "" )) ){ %>
                                    <div class="dropdown">
    <a href="javascript:;" class="dropdown-toggle" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>
        <span class="caret"></span>
    </a>
    <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
        
                                        <li href="main.jsp"><a href="main.jsp">个人中心</a></li>
                                        <li href="logout.jsp" onclick="return confirm('你确定退出？')"><a href="logout.jsp" onclick="return confirm('你确定退出？')">退出</a></li>
                                    
    </ul>
    
</div>
                                    <% } else { %>
                                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#loginModel">
    登录
</button>
                                                                        <% } %>
                                </div>
                                <div class="header_account-list search_bar">
                                    <a href="javascript:void(0)"><span class="icondianzi icondianzi-Search"></span></a>
                                    <div class="dropdown_search">
                                        <div class="search_close_btn">
                                            <a href="javascript:;"><i class="fa fa-close"></i></a>
                                        </div>
                                        <form action="list.jsp">
                                            <input type="text" value="<%= request.getParameter("") !=null ? request.getParameter("") : "" %>" name="" placeholder="输入关键词搜索"/>
                                            <button type="submit"><span class="icondianzi icondianzi-Search"></span></button>
                                        </form>
                                    </div>
                                </div>
                                <div class="header_account-list mini_cart_wrapper" id="mini-cart-wrapper-patch">

                                    <!--mini cart end-->
                                </div>

                            </div>
                        
</div>
                    
</div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="0" id="loginModel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title" id="0">登录</h4>
            </div>
            <div class="modal-body">
                <div class="pa10">
                    
            <form action="login?ac=login&a=a" method="post"><!-- form 标签开始 -->
    
                <div class="form-group">
    
    
                    <input type="text" class="form-control" name="username" placeholder="输入帐号"/>
                
</div>
                <div class="form-group">
    
    
                    <input type="password" class="form-control" name="pwd" placeholder="密码"/>
                
</div>
                <div class="form-group">
    
    
                    <select class="form-control" name="cx">

                        <option value="用户">用户</option>                    
</select>
                
</div>
                <div class="form-group">
    
    
                    <div class="input-group">
    
                        <input type="text" class="form-control" name="pagerandom" placeholder="输入验证码"/>
                        
                    
    <span class="input-group-addon"><img src="image.jsp" style="width: 60px;height: 20px;max-width: none; max-height: none;" onclick="this.src='image.jsp?rand='+new Date().getTime()"/></span>
</div>
                
</div>
                <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
        <div class="col-sm-10">
            
                    <button type="submit" class="btn btn-primary">
    登录
</button>
                
        </div>
        
    </div>
</div>
            
<!--form标签结束--></form>
        
                </div>
            </div>
        </div>
    </div>
</div>
        <script>
            (function () {
                var path =location.pathname.substr(1);
                var search = location.search;
                if(search!=''){
                    path += decodeURIComponent(search);
                }
                if(path == '')
                {
                    $('#navbar-str>li:eq(0) a').addClass('active');
                }else{
                    $('#navbar-str>li').each(function () {
                        var href = $(this).find('>a').attr('href');
                        if(href == path)
                        {
                            $(this).find('>a').addClass('active');
                        }
                        if($(this).find('>ul.sub_menu').length > 0)
                        {
                            var that = this;
                            $(this).find('li').each(function () {
                                var href = $(this).find('>a').attr('href');
                                if(href == path)
                                {
                                    $(this).parent().addClass('active');
                                    $(that).addClass('active');
                                }
                            })
                        }
                    })
                }

                /*---dropdown search activation---*/
                $('.search_bar > a').on('click', function(){
                    $('.dropdown_search').addClass('active')
                });

                $('.search_close_btn > a').on('click', function(){
                    $('.dropdown_search').removeClass('active')
                });

            })();
        </script>
    </header>



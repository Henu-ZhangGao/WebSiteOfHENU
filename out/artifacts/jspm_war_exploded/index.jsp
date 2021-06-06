<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@ page import="util.*" %>


<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>

<link rel="stylesheet" href="js/swiper/swiper.css">
<script src="js/swiper/swiper.js"></script>
<link href="js/owl/owl.carousel.min.css" rel="stylesheet">
<script src="js/owl/owl.carousel.min.js"></script>
<div>

    <% ArrayList<HashMap> bhtList = Query.make("lunbotu").order("id desc").limit(5).select(); %>


    <div class="swiper-container" id="banner15">
        <div class="swiper-wrapper">
            <% for (HashMap bht : bhtList) { %>
            <div class="swiper-slide">
                <div class="decoimg_b2">
                    <a class="btn btn-" href="<%= bht.get("url") %>"
                       style="background-image: url('<%= bht.get("image") %>'); height: 360px"></a>
                </div>
            </div>
            <% } %>
        </div>
        <!-- 如果需要分页器 -->
        <div class="swiper-pagination"></div>
        <!-- 如果需要导航按钮 -->
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
    </div>


    <script>
        var mySwiper = new Swiper('#banner15', {
            loop: true, // 循环模式选项
            autoplay: {
                delay: 3000,
                disableOnInteraction: false
            },
            // 如果需要分页器
            pagination: {
                el: '.swiper-pagination',
            },
            // 如果需要前进后退按钮
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            // 如果需要滚动条
            /*scrollbar: {
                el: '.swiper-scrollbar',
            },*/
        })
    </script>


</div>
<div>


    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->


        <div class="title-modelbox-widget">
            <h3 class="section-title">
                <div class="more">
                    <a href="xinwenxinxilist.jsp">更多>></a>
                </div>
                最新新闻
            </h3>
            <div class="sidebar-widget-body">


                <div class="blog_carousel clearfix">
                    <% ArrayList<HashMap> xinwenxinxilist19 = Query.make("xinwenxinxi").limit(4).order("id desc").select(); %>

                    <div class="row clearfix">
                        <% for (HashMap r : xinwenxinxilist19) { %>
                        <div class="article-col col-md-3 col-xs-12">
                            <article class="single_blog">
                                <figure>
                                    <div class="blog_thumb">
                                        <a href="xinwenxinxidetail.jsp?id=<%= r.get("id") %>" class="img-box pb80">
                                            <div class="img" style="background-image: url('<%= r.get("tupian") %>')">
                                            </div>
                                        </a>
                                    </div>
                                    <figcaption class="blog_content">
                                        <h4 class="post_title">
                                            <a href="xinwenxinxidetail.jsp?id=<%= r.get("id") %>">
                                                <%= Info.subStr(r.get("biaoti"), 8) %>
                                            </a>
                                        </h4>

                                        <p class="post_desc">
                                            <%= Info.subStr(r.get("neirong"),25) %>
                                        </p>
                                        <a href="xinwenxinxidetail.jsp?id=<%= r.get("id") %>" class="btn-see"> +
                                            查看详情</a>
                                        <span class="article-price">点击率： <%= r.get("dianjilv") %></span>
                                    </figcaption>
                                </figure>
                            </article>
                        </div>
                        <% } %>
                    </div>

                </div>


            </div>
            <!-- /.sidebar-widget-body -->
        </div>


        <!-- container定宽，并剧中结束 --></div>


</div>
<div>


    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->


        <div class="jianli">
            <h3 class="title">主题新闻</h3>
            <div class="sap_tabs">
                <div class="resp-tabs" style="display: block; width: 100%; margin: 0px;">
                    <ul class="resp-tabs-list wow fadeInUp animated clearfix" data-wow-delay=".7s">
                        <li class="resp-tab-item"><span>国内新闻</span></li>
                        <li class="resp-tab-item"><span>国外新闻</span></li>
                        <li class="resp-tab-item"><span>娱乐新闻</span></li>
                        <li class="resp-tab-item"><span>军事新闻</span></li>
                    </ul>
                    <div class="resp-tabs-container">
                        <div class="tab-1 resp-tab-content">
                            <div class="tab_img clearfix">
                                <% ArrayList<HashMap> xinwenxinxilist24 = Query.make("xinwenxinxi").where("fenlei", "1").limit(4).order("id desc").select(); %>
                                <div class="row">

                                    <% for (HashMap r : xinwenxinxilist24) { %>
                                    <div class="col-md-3">

                                        <div class="portfolio-grids">
                                            <div class="grid">
                                                <a href="xinwenxinxidetail.jsp?id=<%= r.get("id") %>" class="swipebox">
                                                    <div class="img-box pb80">
                                                        <div class="img"
                                                             style="background-image: url('<%= r.get("tupian") %>');background-repeat: no-repeat;"></div>
                                                    </div>
                                                    <div class="figcaption">
                                                        <h4><span><%= r.get("biaoti") %></span></h4>
                                                        <p><%= Info.subStr(r.get("neirong"), 30) %>
                                                        </p>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>

                                    </div>
                                    <% } %>

                                </div>

                            </div>
                        </div>
                        <div class="tab-1 resp-tab-content">
                            <div class="tab_img clearfix">
                                <% ArrayList<HashMap> xinwenxinxilist25 = Query.make("xinwenxinxi").where("fenlei", "2").limit(4).order("id desc").select(); %>
                                <div class="row">

                                    <% for (HashMap r : xinwenxinxilist25) { %>
                                    <div class="col-md-3">

                                        <div class="portfolio-grids">
                                            <div class="grid">
                                                <a href="xinwenxinxidetail.jsp?id=<%= r.get("id") %>" class="swipebox">
                                                    <div class="img-box pb80">
                                                        <div class="img"
                                                             style="background-image: url('<%= r.get("tupian") %>');background-repeat: no-repeat;"></div>
                                                    </div>
                                                    <div class="figcaption">
                                                        <h4><span><%= r.get("biaoti") %></span></h4>
                                                        <p><%= Info.subStr(r.get("neirong"), 30) %>
                                                        </p>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>

                                    </div>
                                    <% } %>

                                </div>

                            </div>
                        </div>
                        <div class="tab-1 resp-tab-content">
                            <div class="tab_img clearfix">
                                <% ArrayList<HashMap> xinwenxinxilist26 = Query.make("xinwenxinxi").where("fenlei", "3").limit(4).order("id desc").select(); %>
                                <div class="row">

                                    <% for (HashMap r : xinwenxinxilist26) { %>
                                    <div class="col-md-3">

                                        <div class="portfolio-grids">
                                            <div class="grid">
                                                <a href="xinwenxinxidetail.jsp?id=<%= r.get("id") %>" class="swipebox">
                                                    <div class="img-box pb80">
                                                        <div class="img"
                                                             style="background-image: url('<%= r.get("tupian") %>');background-repeat: no-repeat;"></div>
                                                    </div>
                                                    <div class="figcaption">
                                                        <h4><span><%= r.get("biaoti") %></span></h4>
                                                        <p><%= Info.subStr(r.get("neirong"), 30) %>
                                                        </p>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>

                                    </div>
                                    <% } %>

                                </div>

                            </div>
                        </div>
                        <div class="tab-1 resp-tab-content">
                            <div class="tab_img clearfix">
                                <% ArrayList<HashMap> xinwenxinxilist27 = Query.make("xinwenxinxi").where("fenlei", "4").limit(4).order("id desc").select(); %>
                                <div class="row">

                                    <% for (HashMap r : xinwenxinxilist27) { %>
                                    <div class="col-md-3">

                                        <div class="portfolio-grids">
                                            <div class="grid">
                                                <a href="xinwenxinxidetail.jsp?id=<%= r.get("id") %>" class="swipebox">
                                                    <div class="img-box pb80">
                                                        <div class="img"
                                                             style="background-image: url('<%= r.get("tupian") %>');background-repeat: no-repeat;"></div>
                                                    </div>
                                                    <div class="figcaption">
                                                        <h4><span><%= r.get("biaoti") %></span></h4>
                                                        <p><%= Info.subStr(r.get("neirong"), 30) %>
                                                        </p>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>

                                    </div>
                                    <% } %>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- container定宽，并剧中结束 --></div>
</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>
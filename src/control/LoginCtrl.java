package control;

import dao.CommDAO;
import dao.Query;
import util.Info;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Iterator;

/**
 * 前台、后台、登录。
 * 和修改密码项
 */
public class LoginCtrl extends HttpServlet {

    public LoginCtrl() {
        super();
    }

    public void destroy() {
        super.destroy(); // Just puts "destroy" string in log
        // Put your code here
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doPost(request, response);
    }

    public void go(String url, HttpServletRequest request, HttpServletResponse response) {
        try {
            PrintWriter out = response.getWriter();
            System.out.println(request.getAttribute("error"));
            if(request.getAttribute("error")!=null){
                out.println("<script>alert('"+request.getAttribute("error")+"');location.href='"+url+"'</script>");
                out.close();
            }
            request.getRequestDispatcher(url).forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void gor(String url, HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect(url);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String ac = request.getParameter("ac");
        if (ac == null) ac = "";
        CommDAO dao = new CommDAO();
        String date = Info.getDateStr();
        String today = date.substring(0, 10);
        String tomonth = date.substring(0, 7);

        // 前台登录代码
        if (ac.equals("login")) {
            String username = request.getParameter("username");
            String password = request.getParameter("pwd");
            // 判断页面上选择的权限
            String utype = request.getParameter("cx");
            String pagerandom = request.getParameter("pagerandom") == null ? "" : request.getParameter("pagerandom");
            String random = (String) request.getSession().getAttribute("random");
            if (!pagerandom.equals(random) && request.getParameter("a") != null) {
                request.setAttribute("error", "验证码错误");
                go("index.jsp", request, response);
            } else {
                String sql1 = "";
                if (utype.equals("用户")) {
                    sql1 = "select * from yonghu where yonghuming='" + username + "' and mima='" + password + "' ";
                }
                                                                                                                                
                HashMap map = dao.find(sql1);
                if (!map.isEmpty()) {
                    Iterator iter = map.keySet().iterator();
                    request.getSession().setAttribute("username", username);
                    request.getSession().setAttribute("login", utype);
                    request.getSession().setAttribute("cx", utype);

                    while (iter.hasNext()) {
                        String key = (String)iter.next();
                        String val = (String)map.get(key);
                        request.getSession().setAttribute(key, val);
                    }

                    gor("index.jsp", request, response);
                } else {
                    request.setAttribute("error", "账号或密码错误");
                    go("index.jsp", request, response);
                }
            }
        }
        // 后台登录
        if (ac.equals("adminlogin")) {
            String username = request.getParameter("username");
            String password = request.getParameter("pwd");
            // 判断页面上选择的权限
            String utype = request.getParameter("cx");
            String pagerandom = request.getParameter("pagerandom") == null ? "" : request.getParameter("pagerandom");
            String random = (String) request.getSession().getAttribute("random");
            if (!pagerandom.equals(random) && request.getParameter("a") != null) {
                request.setAttribute("error", "验证码错误");
                go("login.jsp", request, response);
            } else {
                String sql1 = "";

                                                if (utype.equals("管理员")) {
                                        sql1 = "select * from admins where username='" + username + "' and pwd='" + password + "' ";
                }
                                                                                                                                                
                HashMap map = dao.find(sql1);
                if (!map.isEmpty()) {

                    Iterator iter = map.keySet().iterator();
                    request.getSession().setAttribute("username", username);
                    request.getSession().setAttribute("cx", utype);
                    request.getSession().setAttribute("login", utype);
                    while (iter.hasNext()) {
                        String key = (String)iter.next();
                        String val = (String)map.get(key);
                        request.getSession().setAttribute(key, val);
                    }
                    gor("main.jsp", request, response);
                } else {
                    request.setAttribute("error", "账号或密码错误");
                    go("login.jsp", request, response);
                }
            }
        }

        //修改密码
        if (ac.equals("adminuppass")) {
            String olduserpass = request.getParameter("ymm");
            String userpass = request.getParameter("xmm1");
            String copyuserpass = request.getParameter("xmm2");
            //  println(Info.getUser(request).get("id").toString());
            // 判断当前权限p
            String cx = (String)request.getSession().getAttribute("login");
            //String oldPassword = "";
            String username = request.getSession().getAttribute("username").toString();
            HashMap m = null;
            String biao = "";
                        if(cx.equals("管理员")){
                biao = "admins";
                                m = Query.make(biao).where("username",username).where("pwd",olduserpass).find();
                // dao.getmaps("username", (String) request.getSession().getAttribute("username"), "admins");
                            }
                        if(cx.equals("用户")){
                biao = "yonghu";
                                m = Query.make(biao).where("yonghuming",username).where("mima",olduserpass).find();
                // dao.getmaps("yonghuming", (String) request.getSession().getAttribute("username"), "yonghu");
                            }
            
            if (m == null || m.isEmpty()) {
                request.setAttribute("error", "原密码错误");
                go("mod.jsp", request, response);
            } else {
                //String id = (String)user.get("id");
                String sql = "";
                                if(cx.equals("管理员")){
                    sql = "UPDATE admins SET pwd='"+userpass+"' WHERE username='"+username+"'";
                }
                                if(cx.equals("用户")){
                    sql = "UPDATE yonghu SET mima='"+userpass+"' WHERE yonghuming='"+username+"'";
                }
                
                dao.commOper(sql);
                request.setAttribute("error", "密码修改成功");
                go("mod.jsp", request, response);
            }
        }

        dao.close();
        out.flush();
        out.close();
    }


    public void init() throws ServletException {
        // Put your code here
    }


}

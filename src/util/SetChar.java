package util;

import dao.Query;
import util.threadlocal.LocalRequestContextHolder;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.*;

public class SetChar extends HttpServlet implements Filter {
    private FilterConfig filterConfig = null;
    private Integer tomcatVersion = null;

    // 是否使用 tomcat 7 编码处理
    private boolean isUseChart = true;

    // Handle the passed-in FilterConfig
    public void init(FilterConfig filterConfig) throws ServletException {

        this.filterConfig = filterConfig;
        String s = filterConfig.getServletContext().getServerInfo().split("/" , 2)[1];

        tomcatVersion = Integer.valueOf(s.split("\\.")[0]);
    }

    /**
     * 过滤器执行
     * @param request
     * @param response
     * @param filterChain
     */
    // Process the request/response pair
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain filterChain) {
        try {
            HttpServletRequest req;
            if(tomcatVersion <= 7 && isUseChart){
                req = new HttpServletRequestImpl((HttpServletRequest) request) ;
            }else{
                req = (HttpServletRequest) request;
            }

            response.setCharacterEncoding("utf-8");
            req.setCharacterEncoding("utf-8");

            LocalRequestContextHolder.setLocalRequestContext(filterConfig.getServletContext(),req,(HttpServletResponse) response );

            filterChain.doFilter(req, response);
        } catch (ServletException sx) {

            //filterConfig.getServletContext().log(sx.getMessage(),sx);
            filterConfig.getServletContext().log(sx.getMessage());
            /* try {
                ((HttpServletResponse) response).sendError(500 , sx.getMessage());
            } catch (IOException e) {
                e.printStackTrace();
            } */
        } catch (IOException iox) {

            filterConfig.getServletContext().log(iox.getMessage(),iox);
            //filterConfig.getServletContext().log(iox.getMessage());
        }
    }

    public class HttpServletRequestImpl extends HttpServletRequestWrapper {
        private HttpServletRequest request;
        private Map<String,String[]> map = null;

        public HttpServletRequestImpl(HttpServletRequest request)
        {
            super(request);
            this.request = request;
        }

        @Override
        public String getParameter(String name) {
            String[] strings = getParameterMap().get(name);
            if(strings!= null && strings.length > 0){ // 防止超出下标
                return strings[0];
            }
            return null;
        }

        @Override
        public Map<String, String[]> getParameterMap() {
            if(map != null){
                return map;
            }
            map = request.getParameterMap();
            String queryString = request.getQueryString();

            HashMap q = parseQueryString(queryString);


            //遍历value， 改成utf-8编码
            for(Map.Entry<String,String[]> entry : map.entrySet())
            {
                //取数组值
                String[] values = entry.getValue();

                for (int i = 0; i < values.length; i++) {
                    try {
                        values[i] = q.containsKey(entry.getKey()) ? new String(values[i].getBytes("ISO-8859-1"),"utf-8") : values[i];
                    } catch (UnsupportedEncodingException e) {
                        e.printStackTrace();
                    }
                }
            }
            return map;
        }

        private HashMap parseQueryString(String s) throws IllegalArgumentException
        {
            Object obj = null;
            HashMap hashtable = new HashMap();
            if(s == null)
                return hashtable;



            StringBuffer stringbuffer = new StringBuffer();

            String as[];

            String s2;

            for(StringTokenizer stringtokenizer = new StringTokenizer(s, "&"); stringtokenizer.hasMoreTokens(); hashtable.put(s2, as))

            {
                String s1 = stringtokenizer.nextToken();

                int i = s1.indexOf(61);

                if(i == -1)
                    throw new IllegalArgumentException();
                s2 = parseName(s1.substring(0, i), stringbuffer);
                String s3 = parseName(s1.substring(i + 1, s1.length()), stringbuffer);
                if(hashtable.containsKey(s2))
                {
                    String as1[] = (String[])hashtable.get(s2);
                    as = new String[as1.length + 1];
                    for(int j = 0; j < as1.length; j++)
                        as[j] = as1[j];
                    as[as1.length] = s3;
                } else
                {
                    as = new String[1];
                    as[0] = s3;
                }
            }
            return hashtable;
        }

        private String parseName(String o1 , StringBuffer buffer)
        {
            return o1;
        }
    }




    // Clean up resources
    public void destroy() {
    }
}

package filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class UserFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();
        if (session.isNew() || session.getAttribute("identity") == null || !(session.getAttribute("identity").equals("teacher") || session.getAttribute("identity").equals("student"))) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }
        filterChain.doFilter(request, response);
    }
}
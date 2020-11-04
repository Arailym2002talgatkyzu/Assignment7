
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;


@WebServlet(name = "servlet", value = "/enter")
public class servlet extends HttpServlet {
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
    request.getSession().setAttribute("count", 1);
    Cookie name =new Cookie("name", request.getParameter("name"));
    Cookie surname = new Cookie("surname", request.getParameter("surname"));
    name.setMaxAge(10*60);
    surname.setMaxAge(10*60);
    response.addCookie(name);
    response.addCookie(surname);
    response.sendRedirect("categories.jsp");
}

protected void doGet(HttpServletRequest request, HttpServletResponse response){}
}
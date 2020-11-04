import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import com.google.gson.Gson;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "cardServlet", value = "/addingCard")
public class cardServlet extends HttpServlet {
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, SecurityException{
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    HttpSession session=request.getSession();
    Cookie[] cookies=request.getCookies();
    boolean active=false;
    for(Cookie cookie:cookies){
        if(cookie.getName().equals("CardItems")) active=true;
    }
    Cookie newCokie=new Cookie("cardItems", "value");
    newCokie.setMaxAge(60);
    response.addCookie(newCokie);
    if(!active){
        session.setAttribute("card", new ArrayList<String>());
    }
    if(request.getParameter("product")!=null){
        ((ArrayList<String>)session.getAttribute("card")).add(request.getParameter("product"));
    }
    String json =new Gson().toJson(((ArrayList<String>)session.getAttribute("card")));
    PrintWriter out=response.getWriter();
    out.print(json);
    out.flush();
}
}

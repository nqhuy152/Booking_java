package booking.controler;

import booking.DAO.Connect;
import booking.model.user;
import booking.sessionUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/login")
public class loginController extends HttpServlet {
    private static final long serialVersionUID = 1;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("error", "");
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/view/sign-in.jsp");
        requestDispatcher.forward(req, resp);
        return;
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        try {
            PreparedStatement ps = Connect.con.prepareStatement("SELECT * FROM user where email = ? and  pass = ?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setString(1, req.getParameter("email"));
            ps.setString(2, req.getParameter("password"));

            ResultSet rs = ps.executeQuery();
//            user user= userMapper(rs);
            if (rs.next()) {
//                System.out.println(" " + rs.getString("email") + " " + rs.getString("pass"));
                sessionUtil.getInstance().putValue(req, "user", rs);
                resp.sendRedirect(req.getContextPath() + "/home");
            } else {
                req.setAttribute("error", "Email or Password invalid !");
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/view/sign-in.jsp");
                requestDispatcher.forward(req, resp);
//                req.setAttribute("error", "");
            }
//            resp.sendRedirect("view/customer/home.jsp");
//            Connect.con.close();
        } catch (SQLException | ServletException e) {
            e.printStackTrace();
        }
        return;
    }
}

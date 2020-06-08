package booking.controler;

import booking.DAO.Connect;
import booking.sessionUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/signup")
@MultipartConfig
public class signup extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/view/signup.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Part image = req.getPart("avatar");
            PreparedStatement ps = Connect.con.prepareStatement("INSERT INTO user (email, pass, name, bankNo, DoB, role, avatar)values (?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, req.getParameter("email"));
            ps.setString(2, req.getParameter("pass"));
            ps.setString(3, req.getParameter("name"));
            ps.setString(4, req.getParameter("bank"));
            ps.setString(5, req.getParameter("DoB"));
            ps.setString(6, req.getParameter("role"));
            ps.setBlob(7, image.getInputStream());
            ps.executeUpdate();
            resp.sendRedirect(req.getContextPath() + "/login?email=" + req.getParameter("email"));
//            if(ps.executeUpdate()>0)
//                System.out.println(ps.toString());
//            Connect.con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

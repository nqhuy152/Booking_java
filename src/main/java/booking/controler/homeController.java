package booking.controler;

import booking.DAO.Connect;
import booking.DAO.listHotel;
import booking.DAO.rooms;
import booking.model.hotel;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/home"})
public class homeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/view/customer/home.jsp");
            requestDispatcher.forward(req, resp);
        } else if (action.equals("login")) {
            req.setAttribute("error", "");
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/view/sign-in.jsp");
            requestDispatcher.forward(req, resp);
        } else if (action.equals("logout")) {
            sessionUtil.removeValue(req, "user");
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/view/customer/home.jsp");
            requestDispatcher.forward(req, resp);
        } else if (action.equals("book")) {


        }
    }


}

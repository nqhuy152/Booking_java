package booking.controler;

import booking.DAO.Connect;
import booking.DAO.reviews;
import booking.DAO.rooms;
import booking.model.hotel;
import booking.model.review;
import booking.model.room;
import booking.sessionUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/hotel")
public class hotelPageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("Hid");
        req.setAttribute("Hid", id);
        PreparedStatement ps = null;
        try {
            ps = Connect.con.prepareStatement("SELECT review.*, user.avatar, user.name FROM review LEFT JOIN user ON review.CEmail=user.email WHERE HNo=?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            reviews.getReviews().clear();
            rooms.getRooms().clear();
            while (rs.next()) {
                review rv = new review();
                rv.setTitle(rs.getString("title"));
                rv.setcName(rs.getString("name"));
                rv.setCemail(rs.getString("cEmail"));
                rv.setComment(rs.getString("Comment"));
                rv.setHid(rs.getInt("Hno"));
                rv.setRate(rs.getInt("rating"));
                rv.setTime(rs.getString("time"));
                rv.setcImg(rs.getBytes("avatar"));
                reviews.getReviews().add(rv);
            }
            ps = Connect.con.prepareStatement("SELECT * FROM room WHERE HID=?");
            ps.setString(1, id);
            ResultSet rs2 = ps.executeQuery();
            while (rs2.next()) {
                room room = new room();
                room.setDescription(rs2.getString("rDescription"));
                room.setPrice(rs2.getInt("price"));
                room.setSquare(rs2.getInt("square(m2)"));
                room.setType(rs2.getString("type"));
                room.setNumORoom(rs2.getInt("numberOfRoom"));
                rooms.getRooms().add(room);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("view/hotelPage.jsp");
        requestDispatcher.forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.sendRedirect("view/hotelPage.jsp");
        PreparedStatement ps = null;
        List<String> type = new ArrayList<>();
        List<String> Num = new ArrayList<>();
        boolean isBook = false;

        try {
            ps = Connect.con.prepareStatement("INSERT INTO reservation (cEmail, Hid, rType, quantity, DateFrom, DateTo, BookedDate) value (?, ?, ?, ?, ?, ?, ?)");
            for (int i = 0; i < rooms.getRooms().size(); i++) {
                type.add(rooms.getRooms().get(i).getType());
                Num.add(req.getParameter(type.get(i)));
                if (!Num.get(i).equals("0")) {
                    ps.setString(1, ((ResultSet) sessionUtil.getInstance().getValue(req, "user")).getString("email"));
                    ps.setString(2, req.getParameter("Hid"));
                    ps.setString(3, type.get(i));
                    ps.setString(4, Num.get(i));
                    ps.setString(5, changeFormat(req.getParameter("checkin")));
                    ps.setString(6, changeFormat(req.getParameter("checkout")));
                    ps.setString(7, LocalDate.now().toString());
                    ps.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("view/customer/home.jsp");
    }

    private static String changeFormat(String a) {
        String b = "";
        b += a.substring(6) + "/";
        b += a.substring(0, 2);
        b += a.substring(2, 5);

        return b;
    }
}

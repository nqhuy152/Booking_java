package booking.controler;

import booking.DAO.Connect;
import booking.DAO.reservations;
import booking.DAO.reviews;
import booking.model.reservation;
import booking.model.review;
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

@WebServlet(urlPatterns = {"/profile"})
public class profileController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            PreparedStatement ps = Connect.con.prepareStatement("SELECT reservation.*, room.Price, h.Name FROM reservation left join room ON reservation.rType=room.Type AND reservation.Hid = room.HID left join hotel h on room.HID = h.HID WHERE CEmail=?");
            ps.setString(1, req.getParameter("Email"));
            ResultSet rs = ps.executeQuery();
            reservations.getReservations().clear();
            while (rs.next()) {
                reservation reservation = new reservation();
                reservation.setEmail(rs.getString("cEmail"));
                reservation.setDateFrom(rs.getString("dateFrom"));
                reservation.setDateTo(rs.getString("dateTo"));
                reservation.setQuantity(rs.getInt("quantity"));
                reservation.setHid(rs.getInt("HID"));
                reservation.setId(rs.getInt("Id"));
                reservation.setRoomType(rs.getString("RType"));
                reservation.setHName(rs.getString("Name"));
                reservation.setBookedDate(rs.getString("BookedDate"));
                reservation.setPrice(rs.getInt("Price"));
                reservations.getReservations().add(reservation);
            }
            ps.close();
//            Connect.con.close();
//            req.setAttribute("review", rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/view/profile.jsp");
        requestDispatcher.forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}

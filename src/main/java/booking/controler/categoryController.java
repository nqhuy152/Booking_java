package booking.controler;


import booking.DAO.Connect;
import booking.DAO.listHotel;
import booking.model.hotel;

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
import java.time.LocalDate;

import static javax.servlet.http.HttpServletRequest.*;

@WebServlet(urlPatterns = {"/category", "/search"})
public class categoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
//            String qr="";
            LocalDate today = LocalDate.now();
            String checkin = "";
            String checkout = "";
            int x = 0;
            int y = 0;
            if (req.getParameter("checkin").equals("DD / MM / YYYY")) {
                checkin = today.toString();
            } else {
                checkin = changeFormat(req.getParameter("checkin"));
            }

            if (req.getParameter("checkout").equals("DD / MM / YYYY")) {
                checkout = today.plusMonths(6).toString();
            } else {
                checkout = changeFormat(req.getParameter("checkout"));
            }
            if (!req.getParameter("adults").equals("0")) {
                x = +Integer.parseInt(req.getParameter("adults"));
            }
            if (!req.getParameter("children").equals("0")) {
                x += Integer.parseInt(req.getParameter("children")) / 2;
            }
            if (!req.getParameter("room").equals("0")) {
                y = Integer.parseInt(req.getParameter("room"));
            }

            PreparedStatement ps = Connect.con.prepareStatement(
                    "SELECT hotel.*, i.image FROM hotel left join image i on hotel.HID = i.hid WHERE Address LIKE ? AND hotel.HID NOT IN " +
                            "(SELECT a.Hid FROM ( SELECT room.Hid,NumberofRoom, SUM(NumberofRoom*maxPeople) have FROM room LEFT JOIN max ON room.Type = max.rType GROUP BY room.Hid) as a left join (SELECT reservation.Hid,quantity, SUM(quantity*maxPeople) used FROM reservation LEFT JOIN max on reservation.rType=max.rType WHERE DateTo>=? AND DateFrom<=? GROUP BY reservation.Hid) as b ON a.HID=b.Hid WHERE ((quantity is NULL) AND (have<? OR NumberofRoom <?)) OR (have-used)<? OR (NumberofRoom-quantity)<?) GROUP BY hotel.HID");

            ps.setString(1, '%' + req.getParameter("location") + '%');
            ps.setString(2, checkin);
            ps.setString(3, checkout);
            ps.setString(4, String.valueOf(x));
            ps.setString(5, String.valueOf(y));
            ps.setString(6, String.valueOf(x));
            ps.setString(7, String.valueOf(y));
            ResultSet rs = ps.executeQuery();
            listHotel.getHotels().clear();
            while (rs.next()) {
                hotel hotel = new hotel();
                hotel.setRule(rs.getString("rules"));
                hotel.setAddress(rs.getString("Address"));
                hotel.setDescription(rs.getString("Description"));
                hotel.setId(rs.getInt("HID"));
                hotel.setName(rs.getString("Name"));
                hotel.setPhone(rs.getString("Phone"));
                hotel.setManager(rs.getString("Manager"));
                hotel.setImag(rs.getBytes("image"));
                listHotel.getHotels().add(hotel);
//                System.out.println(hotel.toString());
            }
            ps.close();
//            Connect.con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/view/category.jsp");
        requestDispatcher.forward(req, resp);
    }


    private static String changeFormat(String a) {
        String b = "";
        b += a.substring(6) + "/";
        b += a.substring(0, 2);
        b += a.substring(2, 5);

        return b;
    }
}

package booking.DAO;

import booking.model.hotel;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class listHotel {
    private static List<hotel> hotels = new ArrayList<hotel>();

    public void addHotel(hotel hotel) {
        hotels.add(hotel);
    }

    public void clear() {
        hotels.clear();
    }

    public static List<hotel> getHotels() {
        return hotels;
    }

    private void setHotels(List<hotel> hotels) {
        listHotel.hotels = hotels;
    }
}

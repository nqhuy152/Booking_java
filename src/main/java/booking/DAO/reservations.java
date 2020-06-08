package booking.DAO;

import booking.model.reservation;

import java.util.ArrayList;
import java.util.List;

public class reservations {
    static List<reservation> reservations = new ArrayList<>();

    public void clear() {
        reservations.clear();
    }

    public static List<reservation> getReservations() {
        return reservations;
    }

    public void setReservations(List<reservation> reservations) {
        this.reservations = reservations;
    }
}

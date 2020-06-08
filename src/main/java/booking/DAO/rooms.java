package booking.DAO;

import booking.model.room;
import booking.model.room;

import java.util.ArrayList;
import java.util.List;

public class rooms {
    private static List<room> rooms = new ArrayList<>();

    public void addRoom(room room) {
        rooms.add(room);
    }

    public void clear() {
        rooms.clear();
    }

    public static List<room> getRooms() {
        return rooms;
    }
}

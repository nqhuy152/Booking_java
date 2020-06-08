package booking.model;

public class room {
    private int hid;
    private String type;
    private int price;
    private int square;
    private String description;
    private int NumORoom;

    public int getNumORoom() {
        return NumORoom;
    }

    public void setNumORoom(int numORoom) {
        NumORoom = numORoom;
    }

    public int getHid() {
        return hid;
    }

    public void setHid(int hid) {
        this.hid = hid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getSquare() {
        return square;
    }

    public void setSquare(int square) {
        this.square = square;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}

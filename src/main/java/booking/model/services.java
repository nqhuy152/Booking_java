package booking.model;

public class services {
    private int hid;
    private boolean parking;
    private boolean nonSmokingRoom;
    private boolean ariCondition;
    private int dailyHousekeeping;
    private boolean internet;
    private int transportation;
    private boolean pet;

    public int getHid() {
        return hid;
    }

    public void setHid(int hid) {
        this.hid = hid;
    }

    public boolean isParking() {
        return parking;
    }

    public void setParking(boolean parking) {
        this.parking = parking;
    }

    public boolean isNonSmokingRoom() {
        return nonSmokingRoom;
    }

    public void setNonSmokingRoom(boolean nonSmokingRoom) {
        this.nonSmokingRoom = nonSmokingRoom;
    }

    public boolean isAriCondition() {
        return ariCondition;
    }

    public void setAriCondition(boolean ariCondition) {
        this.ariCondition = ariCondition;
    }

    public int getDailyHousekeeping() {
        return dailyHousekeeping;
    }

    public void setDailyHousekeeping(int dailyHousekeeping) {
        this.dailyHousekeeping = dailyHousekeeping;
    }

    public boolean isInternet() {
        return internet;
    }

    public void setInternet(boolean internet) {
        this.internet = internet;
    }

    public int getTransportation() {
        return transportation;
    }

    public void setTransportation(int transportation) {
        this.transportation = transportation;
    }

    public boolean isPet() {
        return pet;
    }

    public void setPet(boolean pet) {
        this.pet = pet;
    }
}

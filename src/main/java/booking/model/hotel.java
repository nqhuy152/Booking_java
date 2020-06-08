package booking.model;

public class hotel {
    private int Id;
    private String name;
    private String address;
    private String phone;
    private String manager;
    private String description;
    private String rule;
    private byte[] imag;

    public byte[] getImag() {
        return imag;
    }

    public void setImag(byte[] image) {
        this.imag = image;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getRule() {
        return rule;
    }

    public void setRule(String rule) {
        this.rule = rule;
    }

    @Override
    public String toString() {
        return "hotel{" +
                "Id=" + Id +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", manager='" + manager + '\'' +
                ", description='" + description + '\'' +
                ", rule='" + rule + '\'' +
                '}';
    }
}

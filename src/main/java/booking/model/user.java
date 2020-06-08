package booking.model;

import org.mariadb.jdbc.MariaDbBlob;

import java.awt.*;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;

public class user {
    private String userName;
    private String password;
    private int role;
    private String email;
    private int phone;
    private int bankAccount;
    private String DoB;
    private byte[] avatar;

    public static user userMapper(ResultSet rs) throws SQLException {
        user user = new user();
        user.setBankAccount(rs.getInt("Bank"));
        user.setDoB(rs.getString("DoB"));
        user.setEmail(rs.getString("Email"));
        user.setPassword(rs.getString("pass"));
        user.setPhone(rs.getInt("Phone"));
        user.setUserName(rs.getString("Name"));
        user.setRole(rs.getInt("role"));
        user.setAvatar(rs.getBytes("avatar"));

        return user;
    }

    public byte[] getAvatar() {
        return avatar;
    }

    public void setAvatar(byte[] avatar) {
        this.avatar = avatar;
    }

    public String getUserName() {
        return userName;
    }

    private void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    private void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    private void setRole(int role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    private void setEmail(String email) {
        this.email = email;
    }

    public int getPhone() {
        return phone;
    }

    private void setPhone(int phone) {
        this.phone = phone;
    }

    public int getBankAccount() {
        return bankAccount;
    }

    private void setBankAccount(int bankAccount) {
        this.bankAccount = bankAccount;
    }

    public String getDoB() {
        return DoB;
    }

    private void setDoB(String doB) {
        DoB = doB;
    }
}

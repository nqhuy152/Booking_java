package login;

public class loginInfo {
    private String username;
    private String password;

    public loginInfo() {
        super();
    }

    public loginInfo(String username, String password) {
        super();
        this.username = username;
        this.password = password;
    }

    String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}

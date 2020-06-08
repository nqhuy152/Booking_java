package booking.service;

import booking.model.user;

public class userService {
    boolean checkLogin(user user) {
        if ("a".equals(user.getEmail()) && "123456".equals(user.getPassword())) {
            return true;
        }
        return false;
    }
}

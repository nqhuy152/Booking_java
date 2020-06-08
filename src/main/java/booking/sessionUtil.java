package booking;

import javax.servlet.http.HttpServletRequest;
import java.sql.ResultSet;

public class sessionUtil {
    private static sessionUtil sessionUtil = null;

    public static sessionUtil getInstance() {
        if (sessionUtil == null)
            sessionUtil = new sessionUtil();
        return sessionUtil;
    }

    public void putValue(HttpServletRequest request, String key, ResultSet value) {
        request.getSession().setAttribute(key, value);
    }

    public Object getValue(HttpServletRequest request, String key) {
        return request.getSession().getAttribute(key);
    }

    public static void removeValue(HttpServletRequest request, String key) {
        request.getSession().removeAttribute(key);
    }
}

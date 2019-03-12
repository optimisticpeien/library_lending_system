package listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class OnlineUsers implements HttpSessionListener {

    private static long sum = 0;
    private static long userNumber = 0;

    public static long getSum() {
        return sum;
    }

    public static long getUserNumber() {
        return userNumber;
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        userNumber++;
        sum++;
        se.getSession().setAttribute("userNumber", userNumber);
        se.getSession().setAttribute("sum", sum);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        userNumber--;
    }
}

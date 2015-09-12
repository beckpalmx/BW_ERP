/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author beckpalmx
 */
import java.net.URL;
import java.util.Calendar;

import com.google.gdata.client.calendar.CalendarService;
import com.google.gdata.data.PlainTextConstruct;
import com.google.gdata.data.calendar.CalendarEventEntry;
import com.google.gdata.data.extensions.Reminder;
import com.google.gdata.data.extensions.Reminder.Method;
import com.google.gdata.util.AuthenticationException;


public class TestGoogleAPI {

    public CalendarService authenticate(String username, String password) {
        CalendarService myService = new CalendarService("exampleCo-exampleApp-1");
        try {
            System.out.println("authenticate: start");
            myService.setUserCredentials("beckpalmx@gmail.com", "asdzxc007");
            System.out.println("authenticate: success");
        } catch (AuthenticationException e) {
            e.printStackTrace();
        }
        return myService;
    }

    public void createEvent(CalendarService service, String content, String username) {
        try {

            URL postURL = new URL("http://www.google.com/calendar/feeds/" + username + "/private/full");

            Calendar calc = Calendar.getInstance();
            calc.add(Calendar.MINUTE, 1);
            String timeStartEvent = calc.get(Calendar.HOUR_OF_DAY) + ":" + calc.get(Calendar.MINUTE);
//   calc.add(Calendar.MINUTE, 1);
            String timeEndEvent = calc.get(Calendar.HOUR_OF_DAY) + ":" + calc.get(Calendar.MINUTE);

            System.out.println("addEvent: start");
            CalendarEventEntry myEntry = new CalendarEventEntry();
            content += " " + timeStartEvent + "-" + timeEndEvent;
            System.out.println("content: " + content.toString());
            myEntry.setContent(new PlainTextConstruct(content.toString()));
            myEntry.setQuickAdd(true);

            CalendarEventEntry insertedEntry = service.insert(postURL, myEntry);

            Reminder reminder = insertedEntry.getReminder().get(0);
            reminder.setMinutes(0);
            reminder.setMethod(Method.SMS);
            insertedEntry.getReminder().set(0, reminder);
            insertedEntry.update();
            System.out.println("addEvent: complete");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        String username = "username";
        String password = "password";
        String content = "hello";
        TestGoogleAPI helloGoogle = new TestGoogleAPI();
        CalendarService service = helloGoogle.authenticate(username, password);
        helloGoogle.createEvent(service, content, username);
    }

}

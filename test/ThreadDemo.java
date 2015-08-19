
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

class RunnableDemo implements Runnable {

    private Thread t;
    private String threadName;

    RunnableDemo(String name) {
        //SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy h:mm:ss");
        //Timestamp cur_time = new Timestamp(new java.util.Date().getTime());
        //String start_time = sdf.format(cur_time);

        threadName = name;
        //System.out.println("Creating " + threadName + " start_time = " + start_time );
        System.out.println("Creating " + threadName);
    }

    public void run() {

        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy h:mm:ss");
        Timestamp cur_time = new Timestamp(new java.util.Date().getTime());
        String start_time = "";

        System.out.println("Running " + threadName);
        try {

            for (int i = 100; i > 0; i--) {
                cur_time = new Timestamp(new java.util.Date().getTime());
                start_time = sdf.format(cur_time);
                System.out.println("Thread: " + threadName + ", " + i + " start_time = " + start_time);
                // Let the thread sleep for a while.
                Thread.sleep(50);
            }
        } catch (InterruptedException e) {
            System.out.println("Thread " + threadName + " interrupted.");
        }
        String message = "";
        for (int k = 1; k < 10000; k++) {
            //System.out.println("Loop Delay " + k + " " + threadName);
            message += "Loop Delay " + k + " " + threadName;

        }
        cur_time = new Timestamp(new java.util.Date().getTime());
        start_time = sdf.format(cur_time);
        System.out.println("Thread " + threadName + " exiting. Stop Time = " + start_time);
        //System.out.println(message);

    }

    public void start() {
        System.out.println("Starting " + threadName);
        if (t == null) {
            t = new Thread(this, threadName);
            t.start();
        }
    }

    public static void main(String args[]) {

        RunnableDemo R1 = new RunnableDemo("Thread-1");
        R1.start();

        RunnableDemo R2 = new RunnableDemo("Thread-2");
        R2.start();
    }

}

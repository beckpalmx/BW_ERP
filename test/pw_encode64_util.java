
import com.bw.DB.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import org.apache.commons.codec.binary.Base64;

/* 

 import java.sql.*;
 */
public class pw_encode64_util {

    public static void main(String args[]) {
        try {
            DBConnect dbConnect = new DBConnect();
            ResultSet rs;
            Connection con = dbConnect.openTestConnection();
            String Select_UserAcc = "select emp_id,username,password from muser_account ";
            String Update_UserAcc = "";
            PreparedStatement p;
            PreparedStatement p1;
            p = con.prepareStatement(Select_UserAcc);
            rs = p.executeQuery();

            String Enter_Text_Encode = "-";

            byte[] text_encode = Base64.encodeBase64(Enter_Text_Encode.getBytes());

            System.out.println("text_encode = " + new String(text_encode));

            while (rs.next()) {

                byte[] user_encode = Base64.encodeBase64(rs.getString("username").getBytes());
                byte[] pass_encode = Base64.encodeBase64(rs.getString("password").getBytes());

                System.out.println("text_encode = " + rs.getString("username") + " | " + new String(user_encode));

                System.out.println("pass_encode = " + rs.getString("username") + " | " + new String(pass_encode));

                //System.out.println(rs.getString("username") + " : " + rs.getString("password") + " = " + new String(pass_encode));
                Update_UserAcc = "update muser_account set password = '" + new String(pass_encode) + "' where username = '" + rs.getString("username") + "'";

                System.out.println("Update_UserAcc = " + Update_UserAcc);
                //p1 = con.prepareStatement(Update_UserAcc);
                //p1.executeUpdate();                
            }

        } catch (Exception ex) {
            System.out.println("ERROR");
        }
    }
}

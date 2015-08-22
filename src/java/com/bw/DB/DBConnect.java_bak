/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bw.DB;
import java.sql.*;
import org.apache.commons.codec.binary.Base64;

public class DBConnect {

    //public static final String CONNECTION_URL = "jdbc:postgresql://localhost:5432/BWDB_PRODUCT";
    public static  String CONNECTION_URL = "";
    public static  String CONNECTION_URL_MA = "";    
    public static final String USERNAME = "postgres";
    public static final String PASSWORD = "Systemadmin007";
    //Connect Mysql For Weight Scale System
    public static final String MYSQL_CONNECTION_URL = "jdbc:mysql://bw-rv016.dyndns.org:3306/genius_data";
    public static final String MYSQL_USERNAME = "cgc";
    public static final String MYSQL_PASSWORD = "systemadmin";       
    

    /*public DBConnect() {
    }*/
    

    public Connection openTestConnection() throws Exception {
        Connection conn;
        Class.forName("org.postgresql.Driver");
        String db_postgres_jdbc = "jdbc:postgresql://localhost:5432/BWDB_PRODUCT_2558";
        // System.out.println(OS);
        byte[] user_decode = Base64.decodeBase64(USERNAME);
        byte[] pass_decode = Base64.decodeBase64(PASSWORD);
        conn = DriverManager.getConnection(db_postgres_jdbc, USERNAME, PASSWORD);
        //conn = DriverManager.getConnection(db_postgres_jdbc, new String(user_decode), new String(pass_decode));
        if (conn == null) {
            throw new SQLException("Cannot initial database connection, because it's NULL.");
        }
        //System.out.println("#: PostgreSQL connection opened := "+conn);
        return conn;
    }    

    public Connection openNewConnection() throws Exception {
        Connection conn = null;
        Class.forName("org.postgresql.Driver");
        conn = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
        if (conn == null) {
            throw new SQLException("Cannot initail database connection, because it's NULL.");
        }
        //System.out.println("#: mySQL connection opened := "+conn);
        return conn;
    }
    
    public Connection openNewConnectionMySQL() throws Exception {
        Connection conn = null;
        Class.forName("com.mysql.jdbc.Driver");       

        conn = DriverManager.getConnection(MYSQL_CONNECTION_URL, MYSQL_USERNAME, MYSQL_PASSWORD);
        if (conn == null) {
            throw new SQLException("Cannot initial database connection, because it's NULL.");
        }
        //System.out.print("DATABASE Connect to : "+MYSQL_CONNECTION_URL);
        //System.out.println("#: mysql connection opened := "+conn);
        return conn;
    }    

    public void closeConnection(Connection conn) throws Exception {
        if (conn != null) {
            //System.out.println("#: mySQL connection {"+conn+"} has been droped.");
            conn.close();
        }
    }
}
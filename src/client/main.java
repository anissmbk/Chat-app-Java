package client;

import java.sql.*;
import java.util.ArrayList;

public class main {

    public static void main(String[] args){
        String information = "ouail;ouail1";
        String[] infos = information.split(";");
        try {
            Class.forName("org.postgresql.Driver");
        }catch (ClassNotFoundException e1) {
            System.out.println("erreur class not found");
            return;
        }
        try {
            String username = "ouail";
            String password = "ouail1";
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/JavaApp","ouail","OUAIL");
            ResultSet rs = con.createStatement().executeQuery("select * from public.user where username='" + username + "' AND password='" + password + "'");
            ArrayList<String> array = new ArrayList<String>();
            while(rs.next()){
                System.out.println(rs.getObject(1));
            }
        } catch (Exception e1) {
            System.out.println("can't connect to db");
            return;
        }
        System.out.println("connected to db" + infos[0] + " : " + infos[1]);

    }

}


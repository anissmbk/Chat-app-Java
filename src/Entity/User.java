package Entity;

import provider.ApiCrud;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class User {
    protected int id;
    protected String username;
    protected String password;
    protected String email;
    protected String nom;
    protected boolean sexe;
    protected String photo;
    protected Date birth;
    final String TIME_FORMAT = "yyyy-MM-dd HH:mm:ss.SSSX";
    final SimpleDateFormat sdf = new SimpleDateFormat(TIME_FORMAT);

    public User(String username, String password, String email) {
        this.username = username;
        this.password = password;
        this.email = email;
        System.out.println("nouvelle utilisateur");
    }

    public User(String username,String password) throws SQLException, ParseException {
        this.username=username;
        this.password=password;
    }

    public User(){
        System.out.println("verification utilisateur");
    }

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public String getNom() {
        return nom;
    }

    public boolean isSexe() {
        return sexe;
    }

    public String getPhoto() {
        return photo;
    }

    public Date getBirth() {
        return birth;
    }

    public boolean Verification_data_user(String username,String password) throws SQLException, ParseException {
        ApiCrud crud = new ApiCrud();
        return crud.get_data_user(username, password) != null;
    }

    public boolean Add_data_user() throws SQLException, ParseException {
        ApiCrud crud = new ApiCrud();
        return crud.add_data_user(this.username,this.password,this.email);
    }

    public static void main(String[] args) throws SQLException, ParseException {
        User user = new User("ouail","ouaillsq");
    }

}

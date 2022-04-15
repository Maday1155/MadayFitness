package fitness.data;

import java.sql.*;

import fitness.data.User;
import fitness.data.User;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
public class UserDB {

    public static int insert(User user) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "INSERT INTO User (Username, Password, FirstName, LastName) "
                + "VALUES (?, ?, ?, ?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getFirstName());
            ps.setString(4, user.getLastName());
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int update(User user) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "UPDATE User SET "
                + "Password = ?, "
                + "FirstName = ?, "
                + "LastName = ? "
                + "Username = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getFirstName());
            ps.setString(4, user.getLastName());
            
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int delete(User user) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "DELETE FROM User "
                + "WHERE Username = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user.getUsername());

            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static boolean userExists(String username) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT Username FROM User "
                + "WHERE Username = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static User selectUser(String username) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM User "
                + "WHERE Username = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            User user = null;
            if (rs.next()) {
                user = new User();
                user.setFirstName(rs.getString("Username"));
                user.setFirstName(rs.getString("FirstName"));
                user.setLastName(rs.getString("LastName"));
            }
            return user;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }
    
    public ArrayList validateUser(String username, String password, String firstname, String lastname){
        ArrayList al = new ArrayList();
        
        String regex = "^(?=.*[0-9])"
                       + "(?=.*[a-z])(?=.*[A-Z])"
                       + "(?=\\S+$).{8,20}$";
  
        // Compile the ReGex
        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(password);
        if ((firstname == null) || (firstname.equals(""))) {
            al.add("Provide First Name...");
        } if ((lastname == null) || (lastname.equals(""))) {
            al.add("Provide Last Name...");
        } if ((username == null) || (username.equals(""))) {
            al.add("Provide Username...");
        } if ((password == null) || (password.equals(""))) {
            al.add("Provide password...");
        } else if (!m.matches()) {
            al.add("A minimum 8 characters password contains a combination of a Uppercase, a Lowercase letter and a number...");
        }        
        return al;
    }
    
    public static boolean authenticateUser(String username, String password) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean valid = false;
        String query = "SELECT * FROM User "
                + "WHERE Username = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            User user = null;
            String usern = "";
            String pass = "";
            if (rs.next()) {
                usern = rs.getString("Username");
                if(usern.equals(username)){
                    pass = rs.getString("Password");
                    if(pass.equals(password)) {
                        valid = true;
                    }
                }
            }
            return valid;
        } catch (SQLException e) {
            System.out.println(e);
            return valid;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }
}
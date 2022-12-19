package univolunteer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProfileDAO {

    public List<Profile> getProfiles() throws Exception {
		
		List<Profile> profiles = new ArrayList<Profile>();

		String sql = "SELECT * FROM profile;";
        Connection con = null;
        DB db = new DB();

        try {
            
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            int sum = 0;

            while (rs.next() && sum < 20) {

                profiles.add(new Profile(rs.getString("username"), rs.getString("name"), rs.getString("surname"),
				rs.getString("email"), rs.getString("comments"),  rs.getString("country"), rs.getString("city"), rs.getString("image")));

                sum++;
            }

            rs.close();
            stmt.close();
            db.close();

            return profiles;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {

            try {
                db.close();
            } catch (Exception e) {
                
            }

        }
    }

    public List<Profile> findProfiles(String keyword) throws Exception {
		
		List<Profile> profiles = new ArrayList<Profile>();

		String sql = "SELECT * FROM profile WHERE country = ? OR city = ?;";
        Connection con = null;
        DB db = new DB();

        try {
            
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, keyword);
            stmt.setString(2, keyword);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                profiles.add(new Profile(rs.getString("username"), rs.getString("name"), rs.getString("surname"),
				rs.getString("email"), rs.getString("comments"),  rs.getString("country"), rs.getString("city"), rs.getString("image")));
            
            }

            rs.close();
            stmt.close();
            db.close();

            return profiles;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {

            try {
                db.close();
            } catch (Exception e) {
                
            }

        }
    }

    public Profile findProfile(String username) throws Exception {
		
		String sql = "SELECT * FROM profile WHERE username=?;";
        Connection con = null;
        DB db = new DB();
        try {
            
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
			Profile profile = null;


            if (!rs.next()) {

                rs.close();
                stmt.close();
                db.close();
                throw new Exception("Profile with username "+ username + " does not exist!");

            } else {
				
				profile = new Profile(rs.getString("username"), rs.getString("name"), rs.getString("surname"),
				rs.getString("email"), rs.getString("comments"),  rs.getString("country"), rs.getString("city"), rs.getString("image"));
                
            }

            rs.close();
            stmt.close();
            db.close();

            return profile;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {

            try {
                db.close();
            } catch (Exception e) {
                
            }

        }
		
	} 
	
    /**
     * @param username
     * @param name
     * @param surname
     * @param country
     * @param city
     * @param email
     * @param comments
     * @param image
     * @throws Exception
     */
    public void updateInfo(String username, String name, String surname, String country, String city, String email, String comments, String image) throws Exception {
		
		String sql = "SELECT * FROM profile WHERE username=?";
        String sql1 = "UPDATE profile SET name = ?, surname = ?, email = ?"
                + ", comments = ?, country = ?, city = ?, image = ? WHERE username = ?";
        String sql2 = "INSERT INTO profile " 
                + " (username, name, surname, email, comments, country, city, image) VALUES (?, ? ,?, ?, ?, ?, ?, ?)";
        Connection con = null;
        DB db = new DB();
        try {
            
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {

                Profile profile = new Profile(rs.getString("username"), rs.getString("name"), rs.getString("surname"),
				rs.getString("email"), rs.getString("comments"),  rs.getString("country"), rs.getString("city"), rs.getString("image"));
                stmt = con.prepareStatement(sql1);

                if(name == null || name.length() < 1){
                    stmt.setString(1, profile.getName());
                } else {
                    stmt.setString(1, name);
                }
                if(surname == null || surname.length() < 1){
                    stmt.setString(2, profile.getSurname());
                } else {
                    stmt.setString(2, surname);
                }
                if(email == null || email.length() < 1){
                    stmt.setString(3, profile.getEmail());
                } else {
                    stmt.setString(3, email);
                }
                if(comments == null || comments.length() < 1){
                    stmt.setString(4, profile.getComments());
                } else {
                    stmt.setString(4, comments);
                }
                if(country == null || country.length() < 1){
                    stmt.setString(5, profile.getCountry());
                } else {
                    stmt.setString(5, country);
                }
                if(city == null || city.length() < 1){
                    stmt.setString(6, profile.getCity());
                } else {
                    stmt.setString(6, city);
                }
                if(image == null || image.length() < 1){
                    stmt.setString(7, profile.getImage());
                } else {
                    stmt.setString(7, image);
                }
                if(username == null || username.length() < 1){
                    stmt.setString(8, profile.getUsername());
                } else {
                    stmt.setString(8, username);
                }
            
                stmt.executeUpdate();

            } else {

                PreparedStatement stmt2 = con.prepareStatement(sql2);
                stmt2.setString(1, username);
                stmt2.setString(2, name);
            	stmt2.setString(3, surname);
            	stmt2.setString(4, email);
            	stmt2.setString(5, comments);
            	stmt2.setString(6, country);
                stmt2.setString(7, city);
            	stmt2.setString(8, image);
                stmt2.executeUpdate();
                stmt2.close();
                

            }

			rs.close();
            stmt.close();
            db.close();
        
            
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {

            try {
                db.close();
            } catch (Exception e) {
                
            }

        }
		
	} 
	
}

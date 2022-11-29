package univolunteer;
import java.io.EOFException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    public User authenticate(String username, String password){
        Connection con = null;
        
    	//Define the SQL statement (to be executed)
        String sql = "SELECT* FROM user WHERE username = ? AND password = ?";
        DB db = new DB();
        try{
            			
            //open connection and get Connection object			
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            //check validation of data
            if(!rs.next()){
                throw new Exception("Wrong username or password");
            }
            stmt.close();
            rs.close();
            User user = new User(rs.getString("username"),rs.getString("password"),rs.getString("type"));
            return user;

        }catch(Exception e){

            throw new Exception(e.getMessage());

        }finally{

            try {
                db.close();
            } catch (Exception e) {				
             
            }
        }
    }

    public void register(User user){
        Connection con = null;

		//Define the SQL statement (to be executed)
        String checkSql= "SELECT username FROM user WHERE username = ? ;";
		String sql= "INSERT INTO user (username, password, type)  VALUES (?, ?, ?);";
	
		DB db = new DB();
				
		try {
			//open connection and get Connection object			
			con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement( checkSql );
            stmt.setString(1, user.getUsername());
            ResultSet rs = stmt.executeQuery();

            //check username
            if(rs.next()){
                throw new Exception("Username already existed");
            }
            rs.close();
	
			stmt = con.prepareStatement( sql );
			
			//set values to all parameters
			stmt.setString(1, user.getUsername());
			stmt.setString(2, user.getPassword());
			stmt.setString(3, user.getType());
			//execute the SQL statement (INSERT)	
			stmt.executeUpdate();
			
			//close everything to release resources	
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

    public void setfavourite(User user, Application application){
        Connection con = null;

		//Define the SQL statement (to be executed)
		String sql= "INSERT INTO favourites (username, url)  VALUES (?, ?);";
	
		DB db = new DB();
				
		try {
			//open connection and get Connection object			
			con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement( sql );
            stmt.setString(1, user.getUsername());
            stmt.setString(2, application.getUrl());
            stmt.executeUpdate();
			
			//close everything to release resources	
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

    public void removeFavourite(Application application){
        Connection con = null;

		//Define the SQL statement (to be executed)
		String sql= "DELETE FROM 'favourite' WHERE 'url' = ? ;";
	
		DB db = new DB();
				
		try {
			//open connection and get Connection object			
			con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement( sql );
            stmt.setString(1, application.getUrl());
            stmt.executeUpdate();
			
			//close everything to release resources	
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

package univolunteer;
import java.util.ArrayList;
import java.util.List;
import java.io.EOFException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Favourite {

    private String organization;
    private String url;
    private Date date;
    private String region; 
 
    public Favourite(String url, String organization, String date, String region){
        this.organization = organization;
        this.url = url;
        this.date = date;
        this.region = region;
    }

    public Favourite(){

    }

    public List<Favourite> listFavourites(User user){
        DB db = new DB();
		Connection con = db.getConnection();
		List<Favourite> listFavourite = new ArrayList<Favourite>();

		PreparedStatement stmt = null;
		String sql = "SELECT * FROM application,favourite WHERE favourite.username = ? AND favourite.url=application.url;"; 
		try {
			stmt = con.prepareStatement(sql);  
            stmt.setString(1, user.getUsername());
			ResultSet rs = stmt.executeQuery(); 
			while( rs.next() ) {
                Favourite fav = new Favourite(rs.getString("url"),rs.getString("organization"),rs.getDate("event_date"),rs.getString("region"));
				listFavourite.add(fav);
			} 
		} catch (SQLException e) {
			throw new Exception(e.getMessage());
		} finally {
			db.close();
			rs.close();
			stmt.close(); 
		}
		return listFavourite;
    }


    public void setOrganization(String username) {
        this.username = username;
    }

    public String getOrganization() {
        return username;
    }
    public void setUrl(String username) {
        this.username = username;
    }

    public String getUrl() {
        return username;
    }
    public void setDate(String username) {
        this.username = username;
    }

    public String getDate() {
        return username;
    }
    public void setRegion(String username) {
        this.username = username;
    }

    public String getRegion() {
        return username;
    }


    
}
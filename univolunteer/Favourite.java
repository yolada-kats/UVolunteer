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

    public Favourite(String url, String organization, Date date, String region) {
        this.organization = organization;
        this.url = url;
        this.date = date;
        this.region = region;
    }

    public Favourite() {

    }

    public List<Favourite> listFavourites(User user) throws Exception {
        DB db = new DB();
        Connection con = db.getConnection();
        List<Favourite> listFavourite = new ArrayList<Favourite>();

        PreparedStatement stmt = null;
        String sql = "SELECT application.url,organization,event_date,region FROM application,favourites WHERE favourites.username = ? AND favourites.url=application.url;";
        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, user.getUsername());
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Favourite fav = new Favourite(rs.getString("url"), rs.getString("organization"),
                        rs.getDate("event_date"), rs.getString("region"));
                listFavourite.add(fav);
            }
            rs.close();
            stmt.close();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            db.close();
        }
        return listFavourite;
    }

    public void setOrganization(String organization) {
        this.organization = organization;
    }

    public String getOrganization() {
        return organization;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUrl() {
        return url;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getDate() {
        return date;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getRegion() {
        return region;
    }

}
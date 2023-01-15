package univolunteer;

import java.util.ArrayList;
import java.util.List;
import java.io.EOFException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ApplicationDAO {

    public void registerApp(Application application) throws Exception {

        String sql = "INSERT INTO application (url, organization, event_date, region)  VALUES (?, ?, ?, ?);";
        Connection con = null;
        DB db = new DB();

        try {

            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, application.getUrl());
            stmt.setString(2, application.getOrganization());
            stmt.setString(3, application.getDate());
            stmt.setString(4, application.getRegion());

            stmt.executeUpdate();
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
        // end of registerApp
    }
   
    public List<Application> listApplications() throws Exception {
        DB db = new DB();
        Connection con = db.getConnection();
        List<Application> list = new ArrayList<Application>();

        PreparedStatement stmt = null;
        String sql = "SELECT * FROM application;";
        try {
            stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Application app = new Application(rs.getString("url"), rs.getString("organization"),
                        rs.getString("event_date"), rs.getString("region"));
                list.add(app);
            }
            rs.close();
            stmt.close();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            db.close();
        }
        return list;
    }

    // end of class
    public List<Application> findApplications(String keyword) throws Exception {
        DB db = new DB();
		Connection con = null;
        String sql = "SELECT * FROM application WHERE region = ? OR organization = ?;";
        List<Application> findApplications = new ArrayList<Application>();
        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);    
            stmt.setString(1, keyword);
            stmt.setString(2, keyword);
			ResultSet rs = stmt.executeQuery(); 
            if (!rs.next()) {
                throw new Exception("No Organizations found");
            }
            while (rs.next()) {
            Application foundApplications = new Application(rs.getString("url"), rs.getString("organization"),
            rs.getString("event_date"), rs.getString("region"));
            findApplications.add(foundApplications);
            }
            rs.close();
            stmt.close();
            return findApplications;

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

package univolunteer;

import java.sql.*;

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
    // end of class
}

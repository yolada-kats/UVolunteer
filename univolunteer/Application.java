package univolunteer;
import java.sql.Date;

public class Application {

    private String organization;
    private String url;
    private Date date;
    private String region; 
 
    public Application(String url, String organization, Date date, String region){
        this.organization = organization;
        this.url = url;
        this.date = date;
        this.region = region;
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
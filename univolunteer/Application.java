package univolunteer;

import java.sql.Date;

public class Application {

    private String organization;
    private String url;
    private String date;
    private String region;

    public Application(String url, String organization, String date, String region) {
        this.organization = organization;
        this.url = url;
        this.date = date;
        this.region = region;
    }

    public Application() {

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

    public void setDate(String date) {
        this.date = date;
    }

    public String getDate() {
        return date;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getRegion() {
        return region;
    }

}
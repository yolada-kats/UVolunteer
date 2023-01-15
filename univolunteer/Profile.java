package univolunteer;

public class Profile {

    private String username;
    private String name;
    private String surname;
    private String email;
    private String comments;
    private String country;
    private String city;

    public Profile(String username, String name, String surname, String email, String comments, String country,
            String city) {
        this.username = username;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.comments = comments;
        this.country = country;
        this.city = city;

    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getSurname() {
        return surname;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getComments() {
        return comments;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCountry() {
        return country;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCity() {
        return city;
    }

}

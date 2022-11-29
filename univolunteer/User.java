package univolunteer;

public class User {
    
	private String username;
	private String password;
    private String type;

    public User(String username, String password, String type) {        
        this.username = username;
        this.password = password;
        this.type = type;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setPassword(String password) {
        this.password = password;        
    }  

    public String getPassword() {
        return password;
    }

    public void setType(String type) {
        this.type = type;        
    }  

    public String getType() {
        return type;
    }
    
}
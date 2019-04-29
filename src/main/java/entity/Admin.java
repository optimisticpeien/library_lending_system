package entity;

public class Admin {
    private String ID, name, password;

    public Admin() {
    }

    public Admin(String ID, String name, String password) {
        this.ID = ID;
        this.name = name;
        this.password = password;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

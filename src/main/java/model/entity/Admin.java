package model.entity;

/**
 * @author devcolibri on 20.01.17.
 */
public class Admin {
    private String name;

    public Admin() {
    }

    public Admin(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

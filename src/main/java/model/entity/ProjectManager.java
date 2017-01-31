package model.entity;

/**
 * @author devcolibri on 20.01.17.
 */

public class ProjectManager {

    private String name;

    public ProjectManager() {

    }

    public ProjectManager(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

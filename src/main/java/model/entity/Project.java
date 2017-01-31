package model.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

/**
 * @author Igor Gnes on 05.01.17.
 */
@Setter
@Getter
@AllArgsConstructor
public class Project {

    private int id;
    private String name;
    private String description;
    private String task;

    public Project() {
    }
}

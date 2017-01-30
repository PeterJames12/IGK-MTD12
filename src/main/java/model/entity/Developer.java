package model.entity;

import lombok.Getter;
import lombok.Setter;

/**
 * @author devcolibri on 20.01.17.
 */
@Setter
@Getter
public class Developer {

    private String name;
    private String email;
    private String skills;

    public Developer() {
    }
}

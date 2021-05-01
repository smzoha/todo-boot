package com.zedapps.todoboot.entity.enums;

/**
 * @author Shamah M Zoha
 * @since 5/2/2021
 **/
public enum Priority {
    HIGH("High"),
    MEDIUM("Medium"),
    LOW("Low");

    private String naturalName;

    Priority(String naturalName) {
        this.naturalName = naturalName;
    }

    public String getNaturalName() {
        return naturalName;
    }
}

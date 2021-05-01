package com.zedapps.todoboot.entity.enums;

/**
 * @author Shamah M Zoha
 * @since 5/2/2021
 **/
public enum Status {

    ACTIVE("Active"),
    COMPLETED("Completed"),
    DELETED("Deleted"),
    ARCHIVED("Archived");

    private String naturalName;

    Status(String naturalName) {
        this.naturalName = naturalName;
    }

    public String getNaturalName() {
        return naturalName;
    }
}

package com.zedapps.todoboot.entity;

import org.springframework.util.StringUtils;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * @author Shamah M Zoha
 * @since 5/1/2021
 */
@Entity
@Table(name = "user_account")
public class User implements Serializable {

    private static final long serialVersionUID = 0L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "userSeq")
    @SequenceGenerator(name = "userSeq", sequenceName = "user_account_seq", allocationSize = 1)
    private long id;

    @NotNull(message = "{error.required}")
    @Size(min = 3, max = 30, message = "{error.size.range.exceeded.strict}")
    @Column(length = 30, nullable = false)
    private String username;

    @Column(length = 128, nullable = false)
    private String password;

    @NotNull(message = "{error.required}")
    @Size(max = 40, message = "{error.size.max.exceeded}")
    @Column(length = 40, nullable = false)
    private String firstName;

    @NotNull(message = "{error.required}")
    @Size(max = 40, message = "{error.size.max.exceeded}")
    @Column(length = 40, nullable = false)
    private String lastName;

    private boolean active;

    @ElementCollection(fetch = FetchType.EAGER)
    @Column(name = "privilege")
    @CollectionTable(name = "privilege", joinColumns = @JoinColumn(name = "username", referencedColumnName = "username"))
    private List<String> privileges;

    @Transient
    private String inputPassword1;

    @Transient
    private String inputPassword2;

    public User() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public List<String> getPrivileges() {
        return privileges;
    }

    public void setPrivileges(List<String> privileges) {
        this.privileges = privileges;
    }

    public String getInputPassword1() {
        return inputPassword1;
    }

    public void setInputPassword1(String inputPassword1) {
        this.inputPassword1 = inputPassword1;
    }

    public String getInputPassword2() {
        return inputPassword2;
    }

    public void setInputPassword2(String inputPassword2) {
        this.inputPassword2 = inputPassword2;
    }

    @Transient
    public boolean isNew() {
        return this.getId() == 0L;
    }

    @Transient
    public String getPrivilegesString() {
        return new ArrayList<>(privileges).stream()
                .map(priv -> StringUtils.capitalize(priv.toLowerCase()))
                .sorted()
                .collect(Collectors.joining(", "));
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof User)) return false;

        User user = (User) o;

        return getId() == user.getId();
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId());
    }
}

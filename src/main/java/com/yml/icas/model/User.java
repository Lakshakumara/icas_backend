package com.yml.icas.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "users", uniqueConstraints = {
        @UniqueConstraint(name = "user_empno_unique", columnNames = "empNo")
})
public class User implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "empNo", nullable = false, unique = true)
    private String empNo;  // Use empNo as username

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "default_password", nullable = false)
    private boolean defaultPassword = true;

    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinTable(name = "user_roles",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles = new HashSet<>();

    // 🔐 Reset token field
    @Column(name = "reset_token")
    private String resetToken;

    @Column(name = "token_expiry")
    private LocalDateTime tokenExpiry;

    public User() {
    }

    public User(String empNo, String password, Set<Role> roles) {
        this.empNo = empNo;
        this.password = password;
        this.roles = roles;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", empNo='" + empNo + '\'' +
                ", password='" + password + '\'' +
                ", defaultPassword=" + defaultPassword +
                ", roles=" + roles +
                ", resetToken='" + resetToken + '\'' +
                ", tokenExpiry=" + tokenExpiry +
                '}';
    }
}
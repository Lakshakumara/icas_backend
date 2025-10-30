package com.yml.icas.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@Entity
@NoArgsConstructor
@Table(name = "roles")
public class Role {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(length = 20)
    private String role;

    public Role(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", role='" + role + '\'' +
                '}';
    }
}
/*INSERT INTO public.roles VALUES (1, 'ROLE_DEVELOPER');
INSERT INTO public.roles VALUES (2, 'ROLE_SUPERADMIN');
INSERT INTO public.roles VALUES (3, 'ROLE_ADMIN');
INSERT INTO public.roles VALUES (4, 'ROLE_GADHEAD');
INSERT INTO public.roles VALUES (5, 'ROLE_DEPHEAD');
INSERT INTO public.roles VALUES (6, 'ROLE_MEC');
INSERT INTO public.roles VALUES (7, 'ROLE_MO');
INSERT INTO public.roles VALUES (8, 'ROLE_USER');*/
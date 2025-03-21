package com.yml.icas.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Setter
@Getter
@NoArgsConstructor
//@Table(name = "dependant")
@Table(name = "dependant", indexes = {
        @Index(name = "idx_dep_name", columnList = "name")
}, uniqueConstraints = {
        @UniqueConstraint(name = "member_nic_unique", columnNames = {"name","nic","dob"})
})
public class Dependant implements Serializable {
    private static final long serialVersionId = 3L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;

    public Dependant(Integer id) {
        this.id = id;
    }

    @OneToMany(mappedBy = "dependant", cascade = CascadeType.ALL)
    private Set<DependantData> dependantData = new HashSet<>();

    private String name;

    private String nic;

    @Temporal(TemporalType.DATE)
    private Date dob;

    @Override
    public String toString() {
        return "Dependant{" +
                "id=" + id +
                ", dependantData=" + dependantData +
                ", name='" + name + '\'' +
                ", nic='" + nic + '\'' +
                ", dob=" + dob +
                '}';
    }
}

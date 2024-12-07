package com.yml.icas.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@NamedQuery(name = "MemberDependantData.getAllMembersData", query = " from DependantData m ")

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "dependant_data")
public class DependantData implements Serializable {
    private static final long serialVersionId = 5L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    private Member member;

    @ManyToOne(fetch = FetchType.EAGER)
    private Dependant dependant;

    @Column(name = "relasionship")
    private String relationship;

    @Column(name = "registerdate")
    @Temporal(TemporalType.DATE)
    private Date registerDate;

    @Column(name = "registeryear")
    private Integer registerYear;

    private boolean deleted = false;

}

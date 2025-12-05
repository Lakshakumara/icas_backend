package com.yml.icas.hr.model;

import jakarta.persistence.*;
import lombok.Data;

import java.sql.Date;

@Data
@Entity
@Table(name = "hr")
public class HR {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    @Column(name = "emp_no", unique = true)
    private String empNo;
    private String name;
    private String address;
    private String email;
    @Column(name = "contact_no")
    private String contactNo;
    @Column(name = "civil_status")
    private String civilStatus;
    private String nic;
    private String sex;

    @Temporal(TemporalType.DATE)
    private Date dob;

    private String designation;
    private String department;
    @Column(name = "photo_url")
    private String photoUrl;
    private boolean deleted = false;

    @Temporal(TemporalType.DATE)
    @Column(name = "deleted_date")
    private Date deletedDate;
}
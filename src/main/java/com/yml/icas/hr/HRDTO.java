package com.yml.icas.hr;


import lombok.Data;

import java.sql.Date;
@Data
public class HRDTO {
    private Integer id;
    private String empNo;
    private String name;
    private String address;
    private String email;
    private String contactNo;
    private String civilStatus;
    private String nic;
    private String sex;

    private Date dob;

    private String designation;
    private String department;
    private String photoUrl;
    private boolean deleted = false;

    private Date deletedDate;
}

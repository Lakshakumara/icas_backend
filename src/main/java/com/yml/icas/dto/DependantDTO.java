package com.yml.icas.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DependantDTO {
    private Integer id;
    private String name;
    private String nic;
    private Date dob;
    private String relationship;
    private Date registerDate;
    private Integer registerYear;
    private String age;
    private boolean deleted;

    public DependantDTO(Integer id, String name, String nic, Date dob, String relationship, Date registerDate, Integer registerYear, boolean deleted) {
        this.id = id;
        this.name = name;
        this.nic = nic;
        this.dob = dob;
        this.relationship = relationship;
        this.registerDate = registerDate;
        this.registerYear = registerYear;
        this.deleted = deleted;
    }
}

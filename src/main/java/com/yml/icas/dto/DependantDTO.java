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
    private boolean deleted;
}

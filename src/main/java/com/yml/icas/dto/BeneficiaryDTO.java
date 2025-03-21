package com.yml.icas.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class BeneficiaryDTO {
    private Integer id;
    private String name;
    private String nic;
    private String relationship;
    private double percent;
    private Date registerDate;
    private Integer registerYear;
    private boolean deleted = false;

    @Override
    public String toString() {
        return "BeneficiaryDTO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", nic='" + nic + '\'' +
                ", relationship='" + relationship + '\'' +
                ", percent=" + percent +
                ", registerDate=" + registerDate +
                ", registerYear=" + registerYear +
                ", deleted=" + deleted +
                '}';
    }
}

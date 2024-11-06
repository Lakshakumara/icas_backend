package com.yml.icas.dto;

import lombok.Data;

import java.util.Date;

@Data
public class MemberRegistrationDTO {
    private Integer id;
    private Integer memberId;
    private Integer year;
    private String schemeType;
    private Date acceptedDate;
    private Integer acceptedBy;

    @Override
    public String toString() {
        return "MemberRegistrationDTO{" +
                "id=" + id +
                ", memberId=" + memberId +
                ", year=" + year +
                ", schemeType='" + schemeType + '\'' +
                ", acceptedDate=" + acceptedDate +
                ", acceptedBy=" + acceptedBy +
                '}';
    }
}

package com.yml.icas.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.Date;

@Data
@AllArgsConstructor
public class ClaimDataDTO {
    private Integer id;
    private String ClaimDataStatus;
    private Double deductionAmount;
    private String deductionRemarks;
    private Double paidAmount;
    private String rejectRemarks;
    private Date rejectedDate;
    private String remarks;
    private SchemeDTO scheme;
    private Double requestAmount;
    private Double adjustAmount;
    private String adjustRemarks;
}

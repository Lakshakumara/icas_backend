package com.yml.icas.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;
@JsonInclude(JsonInclude.Include.NON_NULL)

@Setter
@Getter
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
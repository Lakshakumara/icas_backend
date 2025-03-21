package com.yml.icas.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.*;

import java.util.Date;

@Setter
@Getter
public class ClaimDataHistoryDTO extends ClaimDataDTO {
    private Integer claimId;
    private Date startDate;
    private Integer dependantId;
    private String dependantName;

    public ClaimDataHistoryDTO(Integer id, String claimDataStatus, Double deductionAmount, String deductionRemarks, Double paidAmount, String rejectRemarks,
                               Date rejectedDate, String remarks,SchemeDTO scheme,
                               Double requestAmount, Double adjustAmount, String adjustRemarks,
                               Integer claimId, Date startDate, Integer dependantId, String dependantName) {
        super(id, claimDataStatus, deductionAmount, deductionRemarks, paidAmount, rejectRemarks, rejectedDate, remarks, scheme, requestAmount, adjustAmount, adjustRemarks);
        this.claimId = claimId;
        this.startDate = startDate;
        this.dependantId = dependantId;
        this.dependantName = dependantName;
    }

    @Override
    public String toString() {
        return "ClaimDataHistoryDTO{" +
                "claimId=" + claimId +
                ", startDate=" + startDate +
                ", dependantId=" + dependantId +
                ", dependantName='" + dependantName + '\'' +
                '}';
    }
}
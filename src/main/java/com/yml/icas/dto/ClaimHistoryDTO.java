package com.yml.icas.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ClaimHistoryDTO {
    private String idText;
    private String title;
    private Double requestAmount;
    private Double deductionAmount;
    private Double adjustAmount;
    private Double paidAmount;
}

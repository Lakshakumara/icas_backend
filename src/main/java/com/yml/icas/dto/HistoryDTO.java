package com.yml.icas.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HistoryDTO {
    private String category;
    private List<String> idText;
    private Object maxAmount;
    private Object itemCount;
    private  Object totalPaid;
}
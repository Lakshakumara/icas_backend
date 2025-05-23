package com.yml.icas.service.interfaces;

import com.yml.icas.dto.*;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.Set;

@Service
public interface ClaimService {
    Integer addClaim(ClaimDTO claimDTO);

    ResponseEntity<Integer> updateClaim(Map<String, Object>[] dataSets);

    ClaimDTO getClaim(Integer claimId);

    //Set<ClaimDTO> getAllClaim(Map<String, String> params);

    Page<ClaimDTO> getAllClaim(Map<String, String> params);
    Set<ClaimDTO> getDashboardData(Integer year, String empNo);

    long[] getVoucherIds();

    Page<ClaimDTO> getTest();

    Page<ClaimDataDTO> getClaimData(Map<String, String> params);

    Set<HistoryDTO> getClaimHistorySummary(Map<String, String> params);
    Page<ClaimHistoryDTO> getClaimDataHistory(Map<String, String> params);

    Page<ClaimDataHistoryDTO> getClaimDataHistoryAll(Map<String, String> params);
}

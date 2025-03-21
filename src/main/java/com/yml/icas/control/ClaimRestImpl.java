package com.yml.icas.control;

import com.yml.icas.dto.*;
import com.yml.icas.service.ClaimServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@Slf4j
@RestController
public class ClaimRestImpl implements ClaimRest {

    @Autowired
    ClaimServiceImpl claimService;

    @Override
    public ResponseEntity<long[]> getVoucherList() {
        try {
            return new ResponseEntity<>(claimService.getVoucherIds(), HttpStatus.OK);
        } catch (Exception ex) {
            ex.printStackTrace();
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public ResponseEntity<Set<ClaimDTO>> getDashboardData(Integer year, String empNo) {
        try {
            return new ResponseEntity<>(claimService.getDashboardData(year, empNo), HttpStatus.OK);
        } catch (Exception ex) {
            ex.printStackTrace();
            return new ResponseEntity<>(new HashSet<>(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public ResponseEntity<Integer> addClaim(ClaimDTO claimDTO) {
        log.info("addClaim {}", claimDTO);
        try {
            return new ResponseEntity<>(claimService.addClaim(claimDTO), HttpStatus.OK);
        } catch (Exception ex) {
            ex.printStackTrace();
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

   /* @Override
    public ResponseEntity<Integer> opdClaimSave(ClaimOPDDTO claimOPDDTO) {
        //log.info("claimRestImpl {}",claimOPDDTO);
        try {
            return claimService.saveOpd(claimOPDDTO);
        } catch (Exception ex) {
            ex.printStackTrace();
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }*/

    @Override
    public ResponseEntity<ClaimDTO> getClaim(Integer claimId) {
        try {
            return new ResponseEntity<>(claimService.getClaim(claimId), HttpStatus.OK);
        } catch (Exception ex) {
            ex.printStackTrace();
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public ResponseEntity<Page<ClaimDataDTO>> getClaimData(Map<String, String> params) {
        try {
            return new ResponseEntity<>(claimService.getClaimData(params), HttpStatus.OK);
        } catch (Exception ex) {
            ex.printStackTrace();
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public ResponseEntity<Page<ClaimDTO>> getAllClaim(Map<String, String> params) {
        Page<ClaimDTO> claimDTO = claimService.getAllClaim(params);
        return ResponseEntity.ok(claimDTO);
    }

    @Override
    public ResponseEntity<Integer> updateClaims(Map<String, Object>[] dataSet) {
        try {
            return claimService.updateClaim(dataSet);
        } catch (Exception ex) {
            ex.printStackTrace();
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public ResponseEntity<Boolean> deleteClaimsData(Integer id) {
        try {
            return new ResponseEntity<>(claimService.deleteClaimData(id), HttpStatus.OK);
        } catch (Exception ex) {
            ex.printStackTrace();
            return new ResponseEntity<>(false, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public ResponseEntity<Page<ClaimDTO>> getTest() {
        Page<ClaimDTO> claimDTO = claimService.getTest();
        return ResponseEntity.ok(claimDTO);
    }

    @Override
    public ResponseEntity<Set<HistoryDTO>> getClaimHistorySummary(Map<String, String> params) {
        Set<HistoryDTO> historyDTOS = claimService.getClaimHistorySummary(params);
        return ResponseEntity.ok(historyDTOS);
    }

    @Override
    public ResponseEntity<Page<ClaimHistoryDTO>> getClaimDataHistory(Map<String, String> params) {
        Page<ClaimHistoryDTO> historyDTOS = claimService.getClaimDataHistory(params);
        return ResponseEntity.ok(historyDTOS);
    }

    @Override
    public ResponseEntity<Page<ClaimDataHistoryDTO>> getClaimDataHistoryAll(Map<String, String> params) {
        Page<ClaimDataHistoryDTO> claimDataHistoryAll = claimService.getClaimDataHistoryAll(params);
        return ResponseEntity.ok(claimDataHistoryAll);
    }

   /* public ResponseEntity<Integer> setClaimAccept(ClaimOPDDTO claimOPDDTO) {
        try {
            return claimService.saveOpd(claimOPDDTO);
        } catch (Exception ex) {
            ex.printStackTrace();
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }*/
}

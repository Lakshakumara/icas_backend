package com.yml.icas.control;

import com.yml.icas.dto.*;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.Set;

@CrossOrigin(origins = "*")
@RequestMapping(path = "/claim")
public interface ClaimRest {
    @PostMapping(path = "/add")
    ResponseEntity<Integer> addClaim(@RequestBody ClaimDTO claimDTO);

    @RequestMapping(method = RequestMethod.PUT, value = "/update")
    ResponseEntity<Integer> updateClaims(@RequestBody Map<String, Object>[] dataSet);

    @RequestMapping(method = RequestMethod.DELETE, value = "/claimData/delete/{id}")
    ResponseEntity<Boolean> deleteClaimsData(@PathVariable(name = "id") Integer id);

    @RequestMapping(method = RequestMethod.GET, value = "/voucherIds")
    ResponseEntity<long[]> getVoucherList();

    @RequestMapping(method = RequestMethod.GET, value = "/dashboard/{year}/{empNo}")
    ResponseEntity<Set<ClaimDTO>> getDashboardData(@PathVariable(name = "year") Integer year,
                                                   @PathVariable(name = "empNo") String empNo);

    @RequestMapping(method = RequestMethod.GET, value = "/get/{claimId}")
    ResponseEntity<ClaimDTO> getClaim(@PathVariable(name = "claimId") Integer claimId);

    @RequestMapping(method = RequestMethod.GET, value = "/getAll")
    ResponseEntity<Page<ClaimDTO>> getAllClaim(@RequestParam Map<String, String> params);

    @RequestMapping(method = RequestMethod.GET, value = "/claimData")
    ResponseEntity<Page<ClaimDataDTO>> getClaimData(@RequestParam Map<String, String> params);

    @RequestMapping(method = RequestMethod.GET, value = "/test")
    ResponseEntity<Page<ClaimDTO>> getTest();

    @RequestMapping(method = RequestMethod.GET, value = "/history")
    ResponseEntity<Page<ClaimHistoryDTO>> getClaimDataHistory(@RequestParam Map<String, String> params);

    @RequestMapping(method = RequestMethod.GET, value = "/history/all")
    ResponseEntity<Page<ClaimDataHistoryDTO>> getClaimDataHistoryAll(@RequestParam Map<String, String> params);

    @RequestMapping(method = RequestMethod.GET, value = "/history/summary")
    ResponseEntity<Set<HistoryDTO>> getClaimHistorySummary(@RequestParam Map<String, String> params);

}
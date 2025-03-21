package com.yml.icas.repository;

import com.yml.icas.dto.ClaimDataHistoryDTO;
import com.yml.icas.dto.ClaimHistoryDTO;
import com.yml.icas.model.ClaimData;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;

public interface ClaimDataRepo extends JpaRepository<ClaimData, Integer> {

    @Query(value = "Select c from claim_data c where c.claim.id =:claimId order by c.id ")
    Page<ClaimData> getClaimData(Integer claimId, Pageable pageable);

    @Query("select new com.yml.icas.dto.ClaimHistoryDTO(" +
            "cd.schemeData.idText, cd.schemeData.title, " +
            "sum(cd.requestAmount), sum(cd.deductionAmount), sum(cd.adjustAmount), sum(cd.paidAmount), " +
            "ARRAY_AGG(cd.claim.id)) " +
            "from claim_data cd " +
            "where (:empNo IS NULL OR :empNo = '' OR lower(cd.claim.member.empNo) = lower(:empNo)) and " +
            "(:idText IS NULL OR cd.schemeData.idText IN :idText) AND cd.paidAmount IS NOT NULL " +
            "group by cd.schemeData.idText, cd.schemeData.title")
    Page<ClaimHistoryDTO> getClaimDataHistory(@Param("empNo") String empNo, @Param("idText") List<String> idText, Pageable pageable);

   /* @Query("select new com.yml.icas.dto.ClaimDataHistoryDTO(" +
            "cd.id, cd.ClaimDataStatus, cd.deductionAmount, cd.deductionRemarks, cd.paidAmount, cd.rejectRemarks, " +
            "cd.rejectedDate, cd.remarks, cd.requestAmount, cd.adjustAmount, cd.adjustRemarks, " +
            "cd.claim.id, cd.claim.startDate, d.id as dependantId, d.name as dependantName) " +
            "from claim_data cd " +
            "left join cd.claim.dependant d " +
            "where (:empNo IS NULL OR :empNo = '' OR lower(cd.claim.member.empNo) = lower(:empNo)) " +
            "and (:idText IS NULL OR cd.schemeData.idText IN :idText) " +
            "order by cd.claim.startDate desc")
    */
    @Query("select new com.yml.icas.dto.ClaimDataHistoryDTO(" +
            "cd.id, cd.ClaimDataStatus, cd.deductionAmount, cd.deductionRemarks, cd.paidAmount, cd.rejectRemarks, " +
            "cd.rejectedDate, cd.remarks,cd.schemeData, cd.requestAmount, cd.adjustAmount, cd.adjustRemarks, " +
            "cd.claim.id, cd.claim.startDate, d.id as dependantId, d.name as dependantName) " +
            "from claim_data cd " +
            "left join cd.claim.dependant d " +
            "where (:empNo IS NULL OR :empNo = '' OR lower(cd.claim.member.empNo) = lower(:empNo)) " +
            "and (:idText IS NULL OR cd.schemeData.idText IN :idText) " +
            "order by cd.claim.startDate desc")
    Page<ClaimDataHistoryDTO> getClaimDataHistoryAll(@Param("empNo") String empNo, @Param("idText") List<String> idText, Pageable pageable);



    @Query("select count(cd.schemeData.idText) as count,sum(cd.paidAmount) as paid " +
            "from claim_data cd " +
            "where cd.paidAmount IS NOT NULL and  (:empNo IS NULL OR :empNo = '' OR lower(cd.claim.member.empNo) = lower(:empNo)) " +
            "and (:idText IS NULL OR cd.schemeData.idText IN :idText)")
    Map<String, Object> getPaymentSummary(@Param("empNo") String empNo, @Param("idText") List<String> idText);
}

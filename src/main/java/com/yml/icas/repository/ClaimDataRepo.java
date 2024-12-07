package com.yml.icas.repository;

import com.yml.icas.dto.ClaimHistoryDTO;
import com.yml.icas.model.ClaimData;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Set;

public interface ClaimDataRepo extends JpaRepository<ClaimData, Integer> {
    @Query(value = "Select c from claim_data c where c.claim.id =:claimId order by c.id ")
    Page<ClaimData> getClaimData(Integer claimId, Pageable pageable);

    @Query("select new com.yml.icas.dto.ClaimHistoryDTO(" +
            "cd.schemeData.idText, cd.schemeData.title, " +
            "sum(cd.requestAmount), sum(cd.deductionAmount), sum(cd.adjustAmount), sum(cd.paidAmount)) " +
            "from claim_data cd " +
            "where (:empNo IS NULL OR :empNo = '' OR lower(cd.claim.member.empNo) = lower(:empNo)) and " +
            "(:idText IS NULL OR cd.schemeData.idText IN :idText)" +
            "group by cd.schemeData.idText, cd.schemeData.title")
    Set<ClaimHistoryDTO> getTitlePayment(@Param("empNo") String empNo, @Param("idText") List<String> idText);


}

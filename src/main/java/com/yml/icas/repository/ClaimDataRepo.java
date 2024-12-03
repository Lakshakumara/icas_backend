package com.yml.icas.repository;

import com.yml.icas.model.ClaimData;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ClaimDataRepo extends JpaRepository<ClaimData, Integer> {
    @Query(value = "Select c from claim_data c where c.claim.id =:claimId order by c.id ")
    Page<ClaimData> getClaimData(Integer claimId, Pageable pageable);
}

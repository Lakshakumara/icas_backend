package com.yml.icas.repository;

import com.yml.icas.model.Claim;
import com.yml.icas.util.IcasUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Repository
public class ClaimRepositoryCustomImpl implements ClaimRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Page<Claim> searchClaims(Map<String, String> params) {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<Claim> cq = cb.createQuery(Claim.class);
        Root<Claim> claim = cq.from(Claim.class);

        List<Predicate> predicates = new ArrayList<>();
        Set<String> keys = params.keySet();
        keys.forEach(s -> {
            String filter = params.get(s);
            if (filter != null && !filter.isEmpty()) {
                String likePattern = "%" + filter.toLowerCase() + "%";
                predicates.add(cb.like(cb.lower(claim.get(s)), likePattern));
            }
        });


       /* if (memberId != null) {
            predicates.add(cb.equal(claim.get("memberId"), memberId));
        }*/

        cq.where(predicates.toArray(new Predicate[0]));
        //cq.orderBy(cb.asc(claim.get("claimDate")));

        Pageable pageable = IcasUtil.createPageable(params);
        TypedQuery<Claim> query = entityManager.createQuery(cq);
        query.setFirstResult((int) pageable.getOffset());
        query.setMaxResults(pageable.getPageSize());

        List<Claim> resultList = query.getResultList();

        CriteriaQuery<Long> countQuery = cb.createQuery(Long.class);
        Root<Claim> claimCount = countQuery.from(Claim.class);
        countQuery.select(cb.count(claimCount))
                .where(predicates.toArray(new Predicate[0]));

        Long count = entityManager.createQuery(countQuery).getSingleResult();

        return new PageImpl<>(resultList, pageable, count);
    }
}

interface ClaimRepositoryCustom {
    Page<Claim> searchClaims(Map<String, String> params);
}
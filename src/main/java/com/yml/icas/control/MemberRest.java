package com.yml.icas.control;

import com.yml.icas.dto.BeneficiaryDTO;
import com.yml.icas.dto.DependantDTO;
import com.yml.icas.dto.MemberDTO;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.Optional;
import java.util.Set;

@CrossOrigin(origins = "*")
@RequestMapping(path = "/member")
public interface MemberRest {

    @GetMapping(path = "/{empNo}")
    ResponseEntity<MemberDTO> getMember(@PathVariable(name = "empNo") String empNo);
    @PostMapping(path = "/signup")
    ResponseEntity<MemberDTO> signup(@RequestBody MemberDTO memberDTO);

    @RequestMapping(method = RequestMethod.GET, value = "/get")
    ResponseEntity<Page<MemberDTO>> searchMember(@RequestParam Map<String, Object> searchParams);

    @RequestMapping(path = {
            "/beneficiaries/{year}/{empNo}",
            "/beneficiaries/{year}/{empNo}/",
            "/beneficiaries/{year}/{empNo}/{name}",
            "/beneficiaries/{year}/{empNo}/{name}/"})
    ResponseEntity<Set<BeneficiaryDTO>> getMemberBeneficiaries(
            @PathVariable(name = "year") int year,
            @PathVariable(name = "empNo") String empNo,
            @PathVariable(name = "name", required = false) String name);

    @RequestMapping(path = {
            "/dependant/{year}/{empNo}",
            "/dependant/{year}/{empNo}/",
            "/dependant/{year}/{empNo}/{name}",
            "/dependant/{year}/{empNo}/{name}/"})
    ResponseEntity<Set<DependantDTO>> getMemberDependants(@PathVariable(name = "year") int year,
                                                          @PathVariable(name = "empNo") String empNo,
                                                          @PathVariable(name = "name", required = false) String name);
    @RequestMapping(method = RequestMethod.PUT, value = "/update/{criteria}")
    ResponseEntity<Integer> updateMember(
            @PathVariable(name = "criteria") String criteria, @RequestBody Map<String, Object> dataSet);

    @RequestMapping(method = RequestMethod.GET, value = "/relationship/{rs}")
    ResponseEntity<String[]> getRelationShip(@PathVariable(name = "rs") String rs);

    @PutMapping("/{memberId}/roles")
    ResponseEntity<Void> updateRoles(@PathVariable Integer memberId, @RequestBody UpdateRolesRequest roles);
}
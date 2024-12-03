package com.yml.icas.control;

import com.yml.icas.dto.BeneficiaryDTO;
import com.yml.icas.dto.DependantDTO;
import com.yml.icas.dto.MemberDTO;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.Set;

@CrossOrigin(origins = "*")
@RequestMapping(path = "/member")
public interface MemberRest {

    @GetMapping(path = "/{empNo}")
    ResponseEntity<MemberDTO> getMember(@PathVariable(name = "empNo") String empNo);
    @PostMapping(path = "/signup")
    ResponseEntity<MemberDTO> signupNew(@RequestBody MemberDTO memberDTO);

    @RequestMapping(method = RequestMethod.GET, value = "/get")
    ResponseEntity<Page<MemberDTO>> searchMember(@RequestParam Map<String, Object> searchParams);

    @GetMapping(path = "/beneficiaries/{year}/{empNo}")
    ResponseEntity<Set<BeneficiaryDTO>> getBeneficiaries(@PathVariable(name = "year") int year,
                                                         @PathVariable(name = "empNo") String empNo);

    @RequestMapping(method = RequestMethod.PUT, value = "/update/{criteria}")
    ResponseEntity<Integer> updateMember(
            @PathVariable(name = "criteria") String criteria, @RequestBody Map<String, Object> dataSet);

    @RequestMapping(method = RequestMethod.GET, value = "/relationship/{rs}")
    ResponseEntity<String[]> getRelationShip(@PathVariable(name = "rs") String rs);

    @PutMapping("/{memberId}/roles")
    ResponseEntity<Void> updateRoles(@PathVariable Integer memberId, @RequestBody UpdateRolesRequest roles);
}
/*@GetMapping
ResponseEntity<Page<MemberDTO>> getMembers(@RequestParam int page, @RequestParam int size, @RequestParam(required = false) String search);

*/

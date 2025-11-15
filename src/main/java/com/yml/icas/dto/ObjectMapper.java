package com.yml.icas.dto;

import com.yml.icas.model.*;
import com.yml.icas.util.IcasUtil;
import com.yml.icas.util.MyConstants;
import lombok.extern.slf4j.Slf4j;

import java.util.*;
import java.util.stream.Collectors;

@Slf4j
public class ObjectMapper {

    public static ClaimDTO mapToClaimDTO(Claim claim) {
        if (Objects.isNull(claim)) return null;
        ClaimDTO cd = new ClaimDTO();
        cd.setId(claim.getId());
        cd.setMemberId(claim.getMember().getId());
        cd.setEmpNo(claim.getMember().getEmpNo());
        cd.setName(claim.getMember().getName());
        cd.setMember(mapToMemberDTO(claim.getMember()));
        cd.setDependant(mapToDependant(claim.getDependant(), MyConstants.getYear(claim.getStartDate())));
        cd.getClaimData().addAll(claim.getClaimData().stream().map(c ->
                        new ClaimDataDTO(c.getId(),
                                c.getClaimDataStatus(),
                                c.getDeductionAmount(),
                                c.getDeductionRemarks(),
                                c.getPaidAmount(),
                                c.getRejectRemarks(),
                                c.getRejectedDate(),
                                c.getRemarks(),
                                mapToSchemeDTO(c.getSchemeData()),
                                c.getRequestAmount(),
                                c.getAdjustAmount(),
                                c.getAdjustRemarks())
                )
                .collect(Collectors.toSet()));
        cd.setCategory(claim.getCategory());
        cd.setRequestFor(claim.getRequestFor());

        cd.setInjuryDate(claim.getInjuryDate());
        cd.setInjuryPlace(claim.getInjuryPlace());
        cd.setInjuryHow(claim.getInjuryHow());
        cd.setInjuryNature(claim.getInjuryNature());

        cd.setIllnessDate(claim.getIllnessDate());
        cd.setIllnessNature(claim.getIllnessNature());
        cd.setIllnessFirstConsultDate(claim.getIllnessFirstConsultDate());
        cd.setIllnessFirstDr(claim.getIllnessFirstDr());
        cd.setHospitalStartDate(claim.getHospitalStartDate());
        cd.setHospitalEndDate(claim.getHospitalEndDate());
        cd.setInfoTreatment(claim.getInfoTreatment());
        cd.setInfoHospital(claim.getInfoHospital());
        cd.setInfoConsultant(claim.getInfoConsultant());

        cd.setClaimDate(claim.getClaimDate());
        cd.setStartDate(claim.getStartDate());
        cd.setRequestAmount(claim.getRequestAmount());

        cd.setAcceptedDate(claim.getAcceptedDate());
        cd.setAcceptedBy(claim.getAcceptedBy());

        cd.setMecSendDate(claim.getMecSendDate());
        cd.setDeductionAmount(claim.getDeductionAmount());
        cd.setPaidAmount(claim.getPaidAmount());
        cd.setVoucherId(claim.getVoucherId());

        cd.setFinanceSendDate(claim.getFinanceSendDate());
        cd.setCompletedDate(claim.getCompletedDate());

        cd.setMecRemarks(claim.getMecRemarks());
        cd.setMecReturnDate(claim.getMecReturnDate());
        cd.setRejectedDate(claim.getRejectedDate());
        cd.setRejectRemarks(claim.getRejectRemarks());

        cd.setClaimStatus(claim.getClaimStatus());
        cd.setRemarks(claim.getRemarks());

        cd.setAppeal(claim.isAppeal());
        cd.setAppealRefId(claim.getAppealRefId());
        cd.setAppealRemarks(claim.getAppealRemarks());
        return cd;
    }

    public static SchemeDTO mapToSchemeDTO(SchemeData schemeData) {
        if (Objects.isNull(schemeData)) return null;
        return new SchemeDTO(schemeData.getId(), schemeData.getIdText(), schemeData.getTitle(),
                schemeData.getDescriptionen(), schemeData.getDescriptionsi(), schemeData.getDescriptionta(),
                schemeData.getMaxAmount(), schemeData.getUnit(), schemeData.getRate(), schemeData.getCategory());
    }

    public static Set<SchemeTitleDTO> mapToSchemeTitleDTO(List<SchemeData> schemeData) {
        if (Objects.isNull(schemeData)) return null;

        SchemeTitleDTO std = null;
        Set<SchemeTitleDTO> schemeTitleDTOS = new HashSet<>();

        for (int i = 0; i <= schemeData.size() - 1; i++) {
            SchemeData sd = schemeData.get(i);
            if (sd.getIdText().startsWith("0")) continue;

            if (sd.getUnit().isEmpty()) {
                if (std != null) {
                    schemeTitleDTOS.add(std);
                }
                std = new SchemeTitleDTO();
                std.setId(sd.getIdText() + " " + sd.getDescriptionen());
            } else {
                if (std != null && !sd.getTitle().isEmpty()) std.addIdText(sd.getTitle() + "-" + sd.getIdText());
            }
            if (i == schemeData.size() - 1) {
                if (std != null) schemeTitleDTOS.add(std);
            }
        }
        return schemeTitleDTOS;
    }

    public static SchemeData mapToSchemeData(SchemeDTO schemeDTO) {
        SchemeData schemeData = new SchemeData();
        schemeData.setId(schemeDTO.getId());
        schemeData.setIdText(schemeDTO.getIdText());
        schemeData.setTitle(schemeDTO.getTitle());
        schemeData.setDescriptionen(schemeDTO.getDescriptionen());
        schemeData.setDescriptionsi(schemeDTO.getDescriptionsi());
        schemeData.setDescriptionta(schemeDTO.getDescriptionta());
        schemeData.setMaxAmount(schemeDTO.getMaxAmount());
        schemeData.setUnit(schemeDTO.getUnit());
        schemeData.setRate(schemeDTO.getRate());
        schemeData.setCategory(schemeDTO.getCategory());
        return schemeData;
    }

    public static MemberDTO mapToMemberDTO(Member member) {
        if (Objects.isNull(member)) return null;
        MemberDTO memberDTO = new MemberDTO();
        memberDTO.setId(member.getId());
        memberDTO.setEmpNo(member.getEmpNo());
        memberDTO.setName(member.getName());
        memberDTO.setAddress(member.getAddress());
        memberDTO.setEmail(member.getEmail());
        memberDTO.setContactNo(member.getContactNo());
        memberDTO.setCivilStatus(member.getCivilStatus());
        memberDTO.setNic(member.getNic());
        memberDTO.setSex(member.getSex());
        memberDTO.setDob(member.getDob());
        memberDTO.setDesignation(member.getDesignation());
        memberDTO.setDepartment(member.getDepartment());
        memberDTO.setPassword(member.getPassword());
        memberDTO.setMDate(member.getMDate());
        memberDTO.setStatus(member.getStatus());
        memberDTO.setPhotoUrl(member.getPhotoUrl());
        memberDTO.setDeleted(member.isDeleted());
        memberDTO.setRegistrationOpen(member.getRegistrationOpen());
       // memberDTO.getRoles().addAll(member.getRoles().stream().map(r -> new RoleDTO(r.getRole()))
          //      .collect(Collectors.toSet()));

        memberDTO.getMemberRegistrations().addAll(member.getMemberRegistrations().stream().map(r -> {
            RegistrationDTO rd = new RegistrationDTO();
            rd.setId(r.getId());
            rd.setYear(r.getYear());
            rd.setSchemeType(r.getSchemeType());
            rd.setAcceptedDate(r.getAcceptedDate());
            rd.setRegisterDate(r.getRegisterDate());
            rd.setAcceptedBy(r.getAcceptedBy());
            return rd;
        }).collect(Collectors.toSet()));

        memberDTO.setCurrentRegistration(mapToMemberRegistrationDTO(member.getMemberRegistrations()));
        return memberDTO;
    }

    public static Member mapToMember(MemberDTO memberDTO) {
        Member member = new Member();
        member.setEmpNo(memberDTO.getEmpNo());
        member.setName(memberDTO.getName());
        member.setAddress(memberDTO.getAddress());
        member.setEmail(memberDTO.getEmail());
        member.setContactNo(memberDTO.getContactNo());
        member.setCivilStatus(memberDTO.getCivilStatus());
        member.setNic(memberDTO.getNic());
        member.setSex(memberDTO.getSex());
        member.setDob(memberDTO.getDob());
        member.setDesignation(memberDTO.getDesignation());
        member.setDepartment(memberDTO.getDepartment());
        member.setPassword(memberDTO.getPassword());
        member.setMDate(memberDTO.getMDate());
        member.setStatus(memberDTO.getStatus());
        member.setPhotoUrl(memberDTO.getPhotoUrl());
        member.setDeleted(memberDTO.isDeleted());
        return member;
    }

    public static DependantDTO mapToDependant(Dependant dependant) {
        DependantDTO dependantDTO = new DependantDTO();
        if (Objects.isNull(dependant)) return dependantDTO;
        dependantDTO.setId(dependant.getId());
        dependantDTO.setName(dependant.getName());
        dependantDTO.setNic(dependant.getNic());
        dependantDTO.setDob(dependant.getDob());
        return dependantDTO;
    }

    public static DependantDTO mapToDependant(Dependant dependant, int year) {
        if (Objects.isNull(dependant)) return null;
        DependantDTO dependantDTO = new DependantDTO();
        dependantDTO.setId(dependant.getId());
        dependantDTO.setName(dependant.getName());
        dependantDTO.setNic(dependant.getNic());
        dependantDTO.setDob(dependant.getDob());
        dependantDTO.setAge(IcasUtil.calAge(dependant.getDob(), MyConstants.TODAY()));
        dependant.getDependantData().forEach(dd -> {
            if (dd.getRegisterYear() == year) {
                dependantDTO.setRegisterYear(year);
                dependantDTO.setRegisterDate(dd.getRegisterDate());
                dependantDTO.setRelationship(dd.getRelationship());
            }
        });
        return dependantDTO;
    }

    @Deprecated
    public static RegistrationDTO mapToMemberRegistrationDTO(List<Registration> memberRegistration) {
        if (Objects.isNull(memberRegistration)) return null;
        RegistrationDTO memberRegistrationDTO = new RegistrationDTO();
        Optional<Registration> max = memberRegistration.stream().max(Comparator.comparingInt(Registration::getYear));
        if (max.isPresent()) {
            memberRegistrationDTO.setYear(max.get().getYear());
            memberRegistrationDTO.setSchemeType(max.get().getSchemeType());
            memberRegistrationDTO.setAcceptedDate(max.get().getAcceptedDate());
            memberRegistrationDTO.setRegisterDate(max.get().getRegisterDate());
        }
        return memberRegistrationDTO;
    }

    public static ClaimDataDTO mapToClaimDataDTO(ClaimData claimData) {
        return new ClaimDataDTO(
                claimData.getId(),
                claimData.getClaimDataStatus(),
                claimData.getDeductionAmount(),
                claimData.getDeductionRemarks(),
                claimData.getPaidAmount(),
                claimData.getRejectRemarks(),
                claimData.getRejectedDate(),
                claimData.getRemarks(),
                mapToSchemeDTO(claimData.getSchemeData()),
                claimData.getRequestAmount(),
                claimData.getAdjustAmount(),
                claimData.getAdjustRemarks()
        );
    }
}
package com.yml.icas.service;

import com.yml.icas.dto.ClaimDTO;
import com.yml.icas.dto.MemberDTO;
import com.yml.icas.dto.ObjectMapper;
import com.yml.icas.dto.RegistrationDTO;
import com.yml.icas.model.Claim;
import com.yml.icas.repository.*;
import com.yml.icas.service.interfaces.DownloadService;
import com.yml.icas.util.IcasUtil;
import com.yml.icas.util.MyConstants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

@Slf4j
@Service
public class DownloadServiceImpl implements DownloadService {

    @Autowired
    MemberRepo memberRepo;

    @Autowired
    RegistrationRepo registrationRepo;
    @Autowired
    BeneficiaryRepo beneficiaryRepo;

    @Autowired
    DependantRepo dependantRepo;
    @Autowired
    ClaimRepo claimRepo;

    @Autowired
    RegistrationRepo memberRegistrationRepo;

    @Override
    public ResponseEntity<byte[]> downloadApplication(Integer year, String empNo) {
        try {
            Set<RegistrationDTO> memberRegistration = registrationRepo.getMemberRegistration(year, empNo);
            if (memberRegistration.isEmpty()) {
                String errorMessage = empNo + " not Found for the Year " + year;
                return ResponseEntity.status(HttpStatus.NOT_FOUND)
                        .contentType(MediaType.TEXT_PLAIN)
                        .body(errorMessage.getBytes());
            }
            MemberDTO memberDTO = memberRepo.getMemberDTOEmpNo(empNo);
            memberDTO.setMemberRegistrations(memberRegistration);
            memberDTO.setBeneficiaries(beneficiaryRepo.getEmployeeBeneficiaries(year, empNo, null));
            memberDTO.setDependants(dependantRepo.getEmployeeDependants(year, empNo, null));
            byte[] pdf = IcasUtil.genApplication(memberDTO);

            HttpHeaders headers = new HttpHeaders();
            //set the PDF format
            headers.setContentType(MediaType.APPLICATION_PDF);
            headers.setContentDispositionFormData("filename", year + "_" + empNo + ".pdf");
            //create the report in PDF format
            log.info("fetch Member for PDF {}", memberDTO);
            return new ResponseEntity<>(pdf, headers, HttpStatus.OK);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            String errorMessage = "Internal Server Error: " + e.getMessage();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .contentType(MediaType.TEXT_PLAIN)
                    .body(errorMessage.getBytes());
        }
    }

    @Override
    public ResponseEntity<byte[]> downloadClaimApplication(Integer claimId) {
        try {
            Claim claim = claimRepo.findClaimById(claimId);
            log.info("findClaimById {}", claim);
            if (Objects.isNull(claim))
                return new ResponseEntity<>((claimId + " not Found").getBytes(), HttpStatus.INTERNAL_SERVER_ERROR);
            ClaimDTO claimDTO = ObjectMapper.mapToClaimDTO(claim);
            log.info("claimDTO {}", claimDTO);
            byte[] pdf = IcasUtil.genClaimApplication(claimDTO);

            HttpHeaders headers = new HttpHeaders();
            //set the PDF format
            headers.setContentType(MediaType.APPLICATION_PDF);
            headers.setContentDispositionFormData("filename", "ClaimOPD" + ".pdf");
            //create the report in PDF format

            return new ResponseEntity<>(pdf, headers, HttpStatus.OK);
        } catch (Exception e) {
            log.info(e.toString());
            return new ResponseEntity<>(MyConstants.ERROR_MSG1.getBytes(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public byte[] downloadVoucher(long voucherId) {
        try {
            List<Claim> claims = claimRepo.findAllByVoucherId(voucherId);
            log.info("voucher claim {}", claims);
            Set<ClaimDTO> claimDtos = claims.stream().map(ObjectMapper::mapToClaimDTO).collect(Collectors.toSet());
            byte[] pdf = IcasUtil.genVoucher(voucherId, claimDtos);

            //create the report in PDF format

            return pdf;
        } catch (Exception e) {
            log.info(e.toString());
            return MyConstants.ERROR_MSG1.getBytes();
        }
    }
}
package com.yml.icas.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Data
@NoArgsConstructor
public class MemberDTO {
    private Integer id;
    private String empNo;
    private String name;
    private String address;
    private String email;
    private String contactNo;
    private String civilStatus;
    private String nic;
    private String sex;
    private Date dob;
    private String designation;
    private String department;
    private String password;
    private Date mDate;
    private String status;
    private String photoUrl;
    private Integer registrationOpen;
    private Set<RoleDTO> roles = new HashSet<>();
    private boolean deleted;

    private MemberRegistrationDTO currentRegistration;
    private Set<MemberRegistrationDTO> memberRegistrations = new HashSet<>();
    private Set<DependantDTO> dependants = new HashSet<>();
    private Set<BeneficiaryDTO> beneficiaries = new HashSet<>();

    public MemberDTO(Integer id, String empNo, String name, String address, String email,
                     String contactNo, String civilStatus, String nic, String sex, Date dob,
                     String designation, String department, String status, String photoUrl,
                     Set<MemberRegistrationDTO> memberRegistrations) {
        this.id = id;
        this.empNo = empNo;
        this.name = name;
        this.address = address;
        this.email = email;
        this.contactNo = contactNo;
        this.civilStatus = civilStatus;
        this.nic = nic;
        this.sex = sex;
        this.dob = dob;
        this.designation = designation;
        this.department = department;
        this.status = status;
        this.photoUrl = photoUrl;
        this.memberRegistrations = memberRegistrations;
    }
}

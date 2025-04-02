package com.yml.icas.dto;

import com.yml.icas.util.IcasUtil;
import com.yml.icas.util.MyConstants;
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
    private String age;
    private String designation;
    private String department;
    private String password;
    private Date mDate;
    private String status;
    private String photoUrl;
    private Integer registrationOpen;
    private Set<RoleDTO> roles = new HashSet<>();
    private boolean deleted;

    private RegistrationDTO currentRegistration;
    private Set<RegistrationDTO> memberRegistrations = new HashSet<>();
    private Set<DependantDTO> dependants = new HashSet<>();
    private Set<BeneficiaryDTO> beneficiaries = new HashSet<>();

    public String getAge() {
        return IcasUtil.calAge(dob, MyConstants.TODAY());
    }

    /**
     *
     * @param id
     * @param empNo
     * @param name
     * @param address
     * @param email
     * @param contactNo
     * @param civilStatus
     * @param nic
     * @param sex
     * @param dob
     * @param designation
     * @param department
     * @param status
     * @param photoUrl
     */
    public MemberDTO(Integer id, String empNo, String name, String address, String email,
                     String contactNo, String civilStatus, String nic, String sex, Date dob,
                     String designation, String department, String status, String photoUrl,Integer registrationOpen) {
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
        //this.age =
        this.designation = designation;
        this.department = department;
        this.status = status;
        this.photoUrl = photoUrl;
        this.registrationOpen = registrationOpen;
    }
}

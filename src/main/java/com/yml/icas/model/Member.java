package com.yml.icas.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@NamedQuery(name = "Member.findByEmpNo", query = "select m from Member m where m.empNo=:empNo")
/*@NamedQuery(name = "Member.getMemberWrap", query = "select new com.yml.Icas.wrapper.MemberWrapper(" +
        "m.id,m.empNo, m.name, m.address, m.email, m.contactNo, m.civilStatus, m.nic, m.sex, m.dob, " +
        "m.designation, m.department, m.mDate,m.status,m.role, m.deleted) from Member m where m.empNo=:empNo")
@NamedQuery(name = "Member.getAllMembers", query = "select new com.yml.Icas.wrapper.MemberWrapper(" +
        "m.id,m.empNo, m.name, m.address, m.email, m.contactNo, m.civilStatus, m.nic, m.sex, m.dob, " +
        "m.designation, m.department, m.mDate,m.status,m.role, m.deleted) from Member m where m.role='user'")*/
@Setter
@Getter
@Entity
@DynamicUpdate
@DynamicInsert
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "member", indexes = {
        @Index(name = "idx_member_name", columnList = "name")
}, uniqueConstraints = {
        @UniqueConstraint(name = "member_nic_unique", columnNames = "nic")
})
@NamedEntityGraphs({
        @NamedEntityGraph(
                name = "Member.withRegistrations",
                attributeNodes = @NamedAttributeNode("memberRegistrations")
        ),
        @NamedEntityGraph(
                name = "Member.withAllDetails",
                attributeNodes = {
                        @NamedAttributeNode("memberRegistrations"),
                        @NamedAttributeNode("beneficiaryData"),
                        @NamedAttributeNode("dependantData")
                }),
})
public class Member implements Serializable {
    private static final long serialVersionId = 4L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "empno", nullable = false, unique = true)
    private String empNo;

    @Column(name = "name", columnDefinition = "TEXT")
    private String name;

    @Column(name = "address", columnDefinition = "TEXT")
    private String address;

    @Column(name = "email")
    private String email;

    @Column(name = "contactno")
    private String contactNo;

    @Column(name = "civilstatus", columnDefinition = "TEXT")
    private String civilStatus;

    @Column(name = "nic")
    private String nic;

    @Column(name = "sex", columnDefinition = "TEXT")
    private String sex;

    @Column(name = "dob")
    @Temporal(TemporalType.DATE)
    private Date dob;

    @Column(name = "designation", columnDefinition = "TEXT")
    private String designation;

    @Column(name = "department", columnDefinition = "TEXT")
    private String department;

    @Column(name = "password")
    private String password;

    @Column(name = "mdate")
    @Temporal(TemporalType.DATE)
    private Date mDate;

    @Column(name = "status", columnDefinition = "TEXT")
    private String status;

    @Column(name = "photourl", columnDefinition = "TEXT")
    private String photoUrl;

/*
    @ManyToMany(cascade = {
            CascadeType.PERSIST,
            CascadeType.MERGE
    }, fetch = FetchType.LAZY)
    @JoinTable(name = "user_roles",
            joinColumns = @JoinColumn(name = "member_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "role_id", referencedColumnName = "id"))
    private Set<Role> roles = new HashSet<>();
*/
    @OneToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id", unique = true)
    private User user;

    @Column(name = "deleted")
    private boolean deleted;

    @Column(name = "registrationopen")
    private Integer registrationOpen = 0;

    @OneToMany(mappedBy = "member", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<Registration> memberRegistrations = new HashSet<>();

    @OneToMany(mappedBy = "member", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<DependantData> dependantData = new HashSet<>();

    @OneToMany(mappedBy = "member", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<BeneficiaryData> beneficiaryData = new HashSet<>();

    @OneToMany(mappedBy = "member", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<Claim> claimSet = new HashSet<>();

    public Member(Integer id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Member{" +
                "id=" + id +
                ", empNo='" + empNo + '\'' +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                ", contactNo='" + contactNo + '\'' +
                ", civilStatus='" + civilStatus + '\'' +
                ", nic='" + nic + '\'' +
                ", sex='" + sex + '\'' +
                ", dob=" + dob +
                ", designation='" + designation + '\'' +
                ", department='" + department + '\'' +
                ", password='" + password + '\'' +
                ", mDate=" + mDate +
                ", status='" + status + '\'' +
                ", deleted=" + deleted +
                ", registrationOpen=" + registrationOpen +
                '}';
    }
}
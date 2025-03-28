package com.yml.icas.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@NamedQuery(name = "ClaimData.getAnyClaims",
        query = "select :claimType")
@Setter
@Getter
@Entity
@NoArgsConstructor
@Table(name = "claim", indexes = {
        @Index(name = "idx_claim_category", columnList = "category"),
        @Index(name = "idx_claim_claimdate", columnList = "claimdate"),
        @Index(name = "idx_claim_claimstatus", columnList = "claimstatus")
})
public class Claim {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    public Claim(Integer id) {
        this.id = id;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    private Member member;

    @OneToMany(mappedBy = "claim", cascade = CascadeType.ALL)
    private Set<ClaimData> claimData = new HashSet<>();
    /**
     * OPD or SHE(Surgical &Hospital Expenses)
     */

    private String category;
    /**
     * Outdoor, Spectacles, covid test etc..
     */
    @Column(name = "requestfor")
    private String requestFor;

    @ManyToOne
    private Dependant dependant;

    @Temporal(TemporalType.DATE)
    @Column(name = "injurydate")
    private Date injuryDate;

    @Column(name = "injuryplace")
    private String injuryPlace;

    @Column(name = "injuryhow")
    private String injuryHow;

    @Column(name = "injurynature")
    private String injuryNature;

    @Temporal(TemporalType.DATE)
    @Column(name = "illnessdate")
    private Date illnessDate;

    @Column(name = "illnessnature")
    private String illnessNature;

    @Temporal(TemporalType.DATE)
    @Column(name = "illnessfirstconsultdate")
    private Date illnessFirstConsultDate;

    @Column(name = "illnessfirstdr")
    private String illnessFirstDr;

    @Temporal(TemporalType.DATE)
    @Column(name = "hospitalstartdate")
    private Date hospitalStartDate;

    @Temporal(TemporalType.DATE)
    @Column(name = "hospitalenddate")
    private Date hospitalEndDate;

    @Column(name = "infotreatment")
    private String infoTreatment;

    @Column(name = "infohospital")
    private String infoHospital;

    @Column(name = "infoconsultant")
    private String infoConsultant;

    @Temporal(TemporalType.DATE)
    @Column(name = "claimdate")
    private Date claimDate;

    @Temporal(TemporalType.DATE)
    @Column(name = "startdate")
    private Date startDate;

    @Column(name = "requestamount")
    private Double requestAmount;

    /**
     * by Head
     */
    @Temporal(TemporalType.DATE)
    @Column(name = "accepteddate")
    private Date acceptedDate;

    @Column(name = "acceptedby")
    private Integer acceptedBy;

    /**
     * by subject
     */
    @Temporal(TemporalType.DATE)
    @Column(name = "mecsenddate")
    private Date mecSendDate;

    @Column(name = "deductionamount")
    private Double deductionAmount;

    @Column(name = "paidamount")
    private Double paidAmount;

    @Column(name = "voucherid")
    private Long voucherId;

    @Temporal(TemporalType.DATE)
    @Column(name = "financesenddate")
    private Date financeSendDate;

    @Temporal(TemporalType.DATE)
    @Column(name = "completeddate")
    private Date completedDate;

    /**
     * by dr or MEC
     */
    @Column(name = "mecremarks")
    private String mecRemarks;

    @Temporal(TemporalType.DATE)
    @Column(name = "mecreturndate")
    private Date mecReturnDate;

    @Temporal(TemporalType.DATE)
    @Column(name = "rejecteddate")
    private Date rejectedDate;

    @Column(name = "rejectremarks")
    private String rejectRemarks;

    /**
     * status
     * pending
     * head_approved
     * mec
     * rejected or approved
     * finance or paid
     * update by everyone
     */
    @Column(name = "claimstatus")
    private String claimStatus;

    @Column(name = "remarks")
    private String remarks;

    @Column(name = "appeal")
    private boolean appeal = false;

    @Column(name = "appealrefid")
    private Integer appealRefId;

    @Column(name = "appealremarks")
    private String appealRemarks;

    @Override
    public String toString() {
        return "Claim{" +
                "id=" + id +
                ", member=" + member +
                ", claimData=" + claimData +
                ", category='" + category + '\'' +
                ", requestFor='" + requestFor + '\'' +
                ", dependant=" + dependant +
                ", injuryDate=" + injuryDate +
                ", injuryPlace='" + injuryPlace + '\'' +
                ", injuryHow='" + injuryHow + '\'' +
                ", injuryNature='" + injuryNature + '\'' +
                ", illnessDate=" + illnessDate +
                ", illnessNature='" + illnessNature + '\'' +
                ", illnessFirstConsultDate=" + illnessFirstConsultDate +
                ", illnessFirstDr='" + illnessFirstDr + '\'' +
                ", hospitalStartDate=" + hospitalStartDate +
                ", hospitalEndDate=" + hospitalEndDate +
                ", infoTreatment='" + infoTreatment + '\'' +
                ", infoHospital='" + infoHospital + '\'' +
                ", infoConsultant='" + infoConsultant + '\'' +
                ", claimDate=" + claimDate +
                ", startDate=" + startDate +
                ", requestAmount=" + requestAmount +
                ", acceptedDate=" + acceptedDate +
                ", acceptedBy=" + acceptedBy +
                ", mecSendDate=" + mecSendDate +
                ", deductionAmount=" + deductionAmount +
                ", paidAmount=" + paidAmount +
                ", voucherId=" + voucherId +
                ", financeSendDate=" + financeSendDate +
                ", completedDate=" + completedDate +
                ", mecRemarks='" + mecRemarks + '\'' +
                ", mecReturnDate=" + mecReturnDate +
                ", rejectedDate=" + rejectedDate +
                ", rejectRemarks='" + rejectRemarks + '\'' +
                ", claimStatus='" + claimStatus + '\'' +
                ", remarks='" + remarks + '\'' +
                ", appeal=" + appeal +
                ", appealRefId=" + appealRefId +
                ", appealRemarks='" + appealRemarks + '\'' +
                '}';
    }
}

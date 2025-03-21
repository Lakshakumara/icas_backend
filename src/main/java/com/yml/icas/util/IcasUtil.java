package com.yml.icas.util;

import com.yml.icas.dto.ClaimDTO;
import com.yml.icas.dto.MemberDTO;
import com.yml.icas.dto.ObjectMapper;
import com.yml.icas.model.Member;
import lombok.extern.slf4j.Slf4j;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.io.FileNotFoundException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.TimeUnit;

@Slf4j
public class IcasUtil {

    public static String DatetoString(Date date) {
        return new SimpleDateFormat("yyyy-MM-dd").format(date);
    }

    public static Date DateToString(Object date) {
        try {
            return DateFormat.getDateInstance(DateFormat.SHORT).parse((String) date);
        } catch (ParseException e) {
            return null;
        }

    }

    public static byte[] genApplication(MemberDTO memberDTO) {
        Map<String, Object> empParams = new HashMap<>();
        empParams.put("title", "APPLICATION FORM TO JOIN THE MEDICAL WELFARE SCHEME FOR " +
                "PERMANENT EMPLOYEES IN THE UNIVERSITY");
        String ageText = calAge(memberDTO.getDob(), MyConstants.TODAY());

        memberDTO.getMemberRegistrations().forEach(r -> {
            empParams.put("schemeType", r.getSchemeType());
        });

        empParams.put("empNo", memberDTO.getEmpNo());
        empParams.put("name", memberDTO.getName());
        empParams.put("address", memberDTO.getAddress());
        empParams.put("email", memberDTO.getEmail());
        empParams.put("contactNo", memberDTO.getContactNo());
        empParams.put("civilStatus", memberDTO.getCivilStatus());
        empParams.put("nic", memberDTO.getNic());
        empParams.put("dob", memberDTO.getDob());
        empParams.put("age", ageText);
        empParams.put("sex", memberDTO.getSex());
        empParams.put("designation", memberDTO.getDesignation());
        empParams.put("department", memberDTO.getDepartment());

        empParams.put("dependants", new JRBeanCollectionDataSource(memberDTO.getDependants()));

        empParams.put("beneficiary", new JRBeanCollectionDataSource(memberDTO.getBeneficiaries()));
        try {
            InputStream reportStream = IcasUtil.class.getResourceAsStream("/memberApplication.jrxml");
            if (reportStream == null) {
                throw new FileNotFoundException("JRXML file not found in classpath");
            }
            JasperPrint empReport = JasperFillManager.fillReport(
                    JasperCompileManager.compileReport(reportStream), // compile from InputStream
                    empParams, // dynamic parameters passed
                    new JREmptyDataSource()
            );
            return JasperExportManager.exportReportToPdf(empReport);
        } catch (Exception e) {
            return e.getMessage().getBytes();
        }
    }

    public static byte[] genApplication(Member member) {
        Map<String, Object> empParams = new HashMap<>();
        empParams.put("title", "APPLICATION FORM TO JOIN THE MEDICAL WELFARE SCHEME FOR " +
                "PERMANENT EMPLOYEES IN THE UNIVERSITY");

        MemberDTO memberDTO = ObjectMapper.mapToMemberDTO(member);

        assert memberDTO != null;
        String ageText = calAge(memberDTO.getDob(), MyConstants.TODAY());

        empParams.put("schemeType", memberDTO.getCurrentRegistration().getSchemeType());

        empParams.put("empNo", memberDTO.getEmpNo());
        empParams.put("name", memberDTO.getName());
        empParams.put("address", memberDTO.getAddress());
        empParams.put("email", memberDTO.getEmail());
        empParams.put("contactNo", memberDTO.getContactNo());
        empParams.put("civilStatus", memberDTO.getCivilStatus());
        empParams.put("nic", memberDTO.getNic());
        empParams.put("dob", memberDTO.getDob());
        empParams.put("age", ageText);
        empParams.put("sex", memberDTO.getSex());
        empParams.put("designation", memberDTO.getDesignation());
        empParams.put("department", memberDTO.getDepartment());

        //empParams.put("member", new JRBeanCollectionDataSource(Arrays.asList(memberDTO)));

        empParams.put("dependants", new JRBeanCollectionDataSource(memberDTO.getDependants()));

        empParams.put("beneficiary", new JRBeanCollectionDataSource(memberDTO.getBeneficiaries()));
        try {
            InputStream reportStream = IcasUtil.class.getResourceAsStream("/memberApplication.jrxml");
            if (reportStream == null) {
                throw new FileNotFoundException("JRXML file not found in classpath");
            }
            JasperPrint empReport = JasperFillManager.fillReport(
                    JasperCompileManager.compileReport(reportStream), // compile from InputStream
                    empParams, // dynamic parameters passed
                    new JREmptyDataSource()
            );
            return JasperExportManager.exportReportToPdf(empReport);
        } catch (Exception e) {
            return e.getMessage().getBytes();
        }
    }

    public static String calAge(Date dob, Date md) {
        Calendar birthDay = Calendar.getInstance();
        birthDay.setTime(dob);
        Calendar measureDate = Calendar.getInstance();
        measureDate.setTime(md);

        int years = measureDate.get(Calendar.YEAR) - birthDay.get(Calendar.YEAR);
        int months;
        int days;
        int currMonth = measureDate.get(Calendar.MONTH) + 1;
        int birthMonth = birthDay.get(Calendar.MONTH) + 1;
        long ageDaysLong = measureDate.getTime().getTime() - birthDay.getTime().getTime();
        //Get difference between months
        months = currMonth - birthMonth;
        //if month difference is in negative then reduce years by one and calculate the number of months.
        if (months < 0) {
            years--;
            months = 12 - birthMonth + currMonth;
            if (measureDate.get(Calendar.DATE) < birthDay.get(Calendar.DATE)) {
                months--;
            }
        } else if (months == 0 && measureDate.get(Calendar.DATE) < birthDay.get(Calendar.DATE)) {
            years--;
            months = 11;
        } else if (months > 0 && measureDate.get(Calendar.DATE) < birthDay.get(Calendar.DATE)) {
            months--;
        }
        //Calculate the days
        if (measureDate.get(Calendar.DATE) > birthDay.get(Calendar.DATE))
            days = measureDate.get(Calendar.DATE) - birthDay.get(Calendar.DATE);
        else if (measureDate.get(Calendar.DATE) < birthDay.get(Calendar.DATE)) {
            Calendar td = Calendar.getInstance();
            td.setTimeInMillis(measureDate.getTimeInMillis());
            int today = td.get(Calendar.DAY_OF_MONTH);
            td.add(Calendar.MONTH, -1);
            days = td.getActualMaximum(Calendar.DAY_OF_MONTH) - birthDay
                    .get(Calendar.DAY_OF_MONTH) + today;
        } else {
            days = 0;
            if (months == 12) {
                years++;
                months = 0;
            }
        }
        Float ageDays = (float) TimeUnit.DAYS.convert(ageDaysLong, TimeUnit.MILLISECONDS);
        return years + "y " + months + "m " + days + "d";
    }

    public static byte[] genClaimApplication(ClaimDTO claimDTO) {
        log.info("claimdto ", claimDTO.getDependant());
        Map<String, Object> empParams = new HashMap<>();
        String pdfTemplate = (claimDTO.getCategory().equalsIgnoreCase("opd")) ?
                "opdApplication" : "SHApplicationFront";
        empParams.put("schemeType", claimDTO.getMember().getCurrentRegistration().getSchemeType());
        empParams.put("empNo", claimDTO.getMember().getEmpNo());
        empParams.put("name", claimDTO.getMember().getName());
        empParams.put("NIC", claimDTO.getMember().getNic());
        empParams.put("department", claimDTO.getMember().getDepartment());
        empParams.put("contactNo", claimDTO.getMember().getContactNo());
        empParams.put("dependants", new JRBeanCollectionDataSource(Collections.singleton(claimDTO.getDependant())));
        Set<ClaimDTO> data = new HashSet<>();
        data.add(claimDTO);
        try {
            InputStream reportStream = IcasUtil.class.getResourceAsStream("/" + pdfTemplate + ".jrxml");
            if (reportStream == null) {
                throw new FileNotFoundException("JRXML file not found in classpath");
            }

            JasperPrint empReport = JasperFillManager.fillReport(JasperCompileManager
                            .compileReport(reportStream)
                    , empParams // dynamic parameters passed
                    , new JRBeanCollectionDataSource(data)
            );
            if (!claimDTO.getCategory().equalsIgnoreCase("opd")) {
                JasperPrint backPage;
                InputStream reportStreamBack = IcasUtil.class.getResourceAsStream("/SHApplicationBack.jrxml");
                if (reportStreamBack == null) {
                    throw new FileNotFoundException("JRXML file not found in classpath");
                }
                backPage = JasperFillManager.fillReport(JasperCompileManager
                                .compileReport(reportStreamBack)
                        , empParams, new JRBeanCollectionDataSource(data));
                empReport.addPage((backPage.getPages()).get(0));
            }
            return JasperExportManager.exportReportToPdf(empReport);

        } catch (Exception e) {
            return e.getMessage().getBytes();
        }
    }

    public static byte[] genVoucher(long voucherId, Set<ClaimDTO> claimDTO) {
        Map<String, Object> empParams = new HashMap<>();
        empParams.put("voucherId", new Date(voucherId));

        try {
            InputStream reportStream = IcasUtil.class.getResourceAsStream("/voucher.jrxml");
            if (reportStream == null) {
                throw new FileNotFoundException("JRXML file not found in classpath");
            }

            JasperPrint empReport =
                    JasperFillManager.fillReport(JasperCompileManager.compileReport(reportStream)
                            , empParams // dynamic parameters passed
                            , new JRBeanCollectionDataSource(claimDTO)
                    );
            return JasperExportManager.exportReportToPdf(empReport);

        } catch (Exception e) {
            return e.getMessage().getBytes();
        }
    }

    /*public static Pageable createPageable(Map<String, Object> params) {
        Pageable pageable = PageRequest.of(Integer.parseInt(params.get("pageIndex").toString()),
                Integer.parseInt(params.get("pageSize").toString()));
        String sortField = params.get("sortField").toString();
        String sortDirection = params.get("sortOrder").toString();
        if(sortField != null && !sortField.isEmpty() && !sortDirection.isEmpty()){
             // "asc" or "desc
            Sort sort = Sort.by(Sort.Direction.fromString(sortDirection), sortField);
            pageable = PageRequest.of(Integer.parseInt(params.get("pageIndex").toString()),
                    Integer.parseInt(params.get("pageSize").toString()), sort);
        }
        return pageable;
    }*/

    public static Pageable createPageableObjects(Map<String, Object> params) {
        Pageable pageable = PageRequest.of(Integer.parseInt(params.get("pageIndex").toString()),
                Integer.parseInt(params.get("pageSize").toString()));
        String sortField = params.get("sortField").toString();
        String sortDirection = params.get("sortOrder").toString();
        if (sortField != null && !sortField.isEmpty() && !sortDirection.isEmpty()) {
            Sort sort = Sort.by(Sort.Direction.fromString(sortDirection), sortField);
            pageable = PageRequest.of(Integer.parseInt(params.get("pageIndex").toString()),
                    Integer.parseInt(params.get("pageSize").toString()), sort);
        }
        return pageable;
    }

    public static Pageable createPageable(Map<String, String> params) {
        Pageable pageable = PageRequest.of(Integer.parseInt(params.get("pageIndex")),
                Integer.parseInt(params.get("pageSize")));
        String sortField = params.get("sortField");
        String sortDirection = params.get("sortOrder");
        if (sortField != null && !sortField.isEmpty() && !sortDirection.isEmpty()) {
            // "asc" or "desc
            Sort sort = Sort.by(Sort.Direction.fromString(sortDirection), sortField);
            pageable = PageRequest.of(Integer.parseInt(params.get("pageIndex")),
                    Integer.parseInt(params.get("pageSize")), sort);
        }
        return pageable;
    }

    public java.util.Date isNIC(String nic) {
        boolean male = true;
        switch (nic.length()) {
            case 9:
            case 10:
                nic = "19".concat(nic);
                break;
            case 12:
                break;
            default:
                return null;
        }
        int data;
        try {
            data = Integer.parseInt(nic.substring(0, 7));
        } catch (NumberFormatException ex) {
            return null;
        }
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR, data / 1000);
        int rest = data % 1000;
        if ((rest > 366 && rest < 500) || (rest > 866)) return null;

        if (rest > 500) {
            male = false;
            rest = rest - 500;
        }
        if (calendar.getActualMaximum(Calendar.DAY_OF_YEAR) == 365) rest = (rest > 59) ? rest - 1 : rest;

        calendar.set(Calendar.DAY_OF_YEAR, rest);
        return calendar.getTime();
    }
}

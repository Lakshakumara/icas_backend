package com.yml.icas.util;

import java.util.Calendar;
import java.util.Date;

public class MyConstants {
    public static String ERROR_MSG1 = "Something goes Wrong try again ..!";
    public static String REGISTRATION_PENDING = "pending";
    public static String REGISTRATION_HEAD_APPROVED = "accepted";
    public static String REGISTRATION_REJECTED= "Rejected";
    public static String DEFAULT_PASSWORD = "user";

    public static String ROLE_USER= "user";
    public static String ROLE_ADMIN = "admin";
    public static String ROLE_GAD_HEAD = "GADHead";
    public static String ROLE_DEP_HEAD = "DepHead";
    public static String ROLE_MO = "mo";
    public static String ROLE_MEC = "mec";
    public static String ROLE_SUPER_ADMIN = "superAdmin";

    public static String SCHEME_INDIVIDUAL = "Individual";
    public static String SCHEME_FAMILY = "Family";
    public static String ALL = "All";
    public static String CATEGORY_OPD = "OPD";
    public static String CATEGORY_SHE = "Surgical & Hospital Expenses";

    public static String CLAIMSTATUS_ALL = "%";
    public static String CLAIMSTATUS_PENDING = "pending";
    public static String CLAIMSTATUS_HEAD_APPROVED = "head_approved";
    public static String CLAIMSTATUS_REJECTED = "rejected";
    public static String CLAIMSTATUS_MEDICAL_DECISION_PENDING = "mec";
    public static String CLAIMSTATUS_MEDICAL_DECISION_APPROVED = "mec_approved";
    public static String CLAIMSTATUS_FINANCE = "finance";
    public static String CLAIMSTATUS_PAID = "paid";

    public static Date TODAY() {
        return new Date();
    }
    public static int getYear(Date date) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        return c.get(Calendar.YEAR);
    }
}

-- V1__Insert_initial_roles.sql

create table beneficiary
(
    id   serial
        primary key,
    name varchar(255),
    nic  varchar(255)
);

alter table beneficiary
    owner to postgres;

create table dependant
(
    id   serial
        primary key,
    dob  date,
    name varchar(255),
    nic  varchar(255)
);

alter table dependant
    owner to postgres;

create table hr
(
    id           serial
        primary key,
    address      varchar(255),
    civil_status varchar(255),
    contact_no   varchar(255),
    deleted      boolean not null,
    deleted_date date,
    department   varchar(255),
    designation  varchar(255),
    dob          date,
    email        varchar(255),
    emp_no       varchar(255)
        constraint uk_bgv9bct2d25avdwp90t2uhv1m
            unique,
    name         varchar(255),
    nic          varchar(255),
    sex          varchar(255)
);

alter table hr
    owner to postgres;

create table member
(
    id               serial
        primary key,
    address          text,
    civilstatus      text,
    contactno        varchar(255),
    deleted          boolean,
    department       text,
    designation      text,
    dob              date,
    email            varchar(255),
    empno            varchar(255) not null
        constraint uk_fs2dmbrh2ged8td1sypwldctn
            unique,
    mdate            date,
    name             text,
    nic              varchar(255)
        constraint member_nic_unique
            unique,
    password         varchar(255),
    registrationopen integer,
    sex              text,
    status           text
);

alter table member
    owner to postgres;

create table beneficiary_data
(
    id             serial
        primary key,
    deleted        boolean not null,
    percent        double precision,
    registerdate   date,
    relasionship   varchar(255),
    beneficiary_id integer
        constraint fkqf7b3mh19l30voxyf422okcc6
            references beneficiary,
    member_id      integer
        constraint fk6obb2l432g14w283cq9ne4evj
            references member
);

alter table beneficiary_data
    owner to postgres;

create table claim
(
    id                      serial
        primary key,
    acceptedby              integer,
    accepteddate            date,
    appeal                  boolean,
    appealrefid             integer,
    appealremarks           varchar(255),
    category                varchar(255),
    claimdate               date,
    claimstatus             varchar(255),
    completeddate           date,
    deductionamount         double precision,
    financesenddate         date,
    hospitalenddate         date,
    hospitalstartdate       date,
    illnessdate             date,
    illnessfirstconsultdate date,
    illnessfirstdr          varchar(255),
    illnessnature           varchar(255),
    infoconsultant          varchar(255),
    infohospital            varchar(255),
    infotreatment           varchar(255),
    injurydate              date,
    injuryhow               varchar(255),
    injurynature            varchar(255),
    injuryplace             varchar(255),
    mecremarks              varchar(255),
    mecreturndate           date,
    mecsenddate             date,
    paidamount              double precision,
    rejectremarks           varchar(255),
    rejecteddate            date,
    remarks                 varchar(255),
    requestamount           double precision,
    requestfor              varchar(255),
    startdate               date,
    voucherid               bigint,
    dependant_id            integer
        constraint fkhjt7aq6c12xtajicm0q4lmq04
            references dependant,
    member_id               integer
        constraint fkb1f4qnsth2py6jn2ufqp2wqb6
            references member
);

alter table claim
    owner to postgres;

create index idx_claim_category
    on claim (category);

create index idx_claim_claimdate
    on claim (claimdate);

create index idx_claim_claimstatus
    on claim (claimstatus);

create table dependant_data
(
    id           serial
        primary key,
    deleted      boolean not null,
    registeryear integer,
    relasionship varchar(255),
    dependant_id integer
        constraint fk7vohpkmndp2eh2b1v4u3hhjnr
            references dependant,
    member_id    integer
        constraint fk6y9aai8vn2xrypvgkc93ggx3c
            references member
);

alter table dependant_data
    owner to postgres;

create index idx_member_name
    on member (name);

create table member_registration
(
    id           serial
        primary key,
    acceptedby   integer,
    accepteddate date,
    schemetype   varchar(255),
    year         integer,
    member_id    integer
        constraint fkhx3k3mjcnwhrxx8dvxf70vfo3
            references member
);

alter table member_registration
    owner to postgres;

create table roles
(
    id   serial
        primary key,
    role varchar(20)
);

alter table roles
    owner to postgres;

create table schemeplan
(
    id            serial
        primary key,
    category      varchar(255),
    descriptionen varchar(1000),
    descriptionsi varchar(1000),
    descriptionta varchar(1000),
    idtext        varchar(255)
        constraint schemeplan_idtext_unique
            unique,
    maxamount     double precision,
    rate          double precision not null,
    title         varchar(255),
    unit          varchar(50)
);

alter table schemeplan
    owner to postgres;

create table claim_data
(
    id               serial
        primary key,
    claimdatastatus  varchar(255),
    deductionamount  double precision,
    deductionremarks varchar(255),
    paidamount       double precision,
    rejectremarks    varchar(255),
    rejecteddate     date,
    remarks          varchar(255),
    requestamount    double precision,
    claim_id         integer
        constraint fkljadg4d760ts3nngfaaiepoqf
            references claim,
    scheme_data_id   integer
        constraint fkirluylyrns7yxwjc77g2x94uw
            references schemeplan
);

alter table claim_data
    owner to postgres;

create table user_roles
(
    member_id integer not null
        constraint fkb66gjl7kcgiamuyhg7ttaf7f6
            references member,
    role_id   integer not null
        constraint fkh8ciramu9cc9q3qcqiv4ue8a6
            references roles,
    primary key (member_id, role_id)
);

alter table user_roles
    owner to postgres;

INSERT INTO roles (role)
SELECT 'user' WHERE NOT EXISTS (SELECT 1 FROM roles WHERE role = 'user');
INSERT INTO roles (role)
SELECT 'admin' WHERE NOT EXISTS (SELECT 1 FROM roles WHERE role = 'admin');
INSERT INTO roles (role)
SELECT 'GADHead' WHERE NOT EXISTS (SELECT 1 FROM roles WHERE role = 'GADHead');
INSERT INTO roles (role)
SELECT 'DepHead' WHERE NOT EXISTS (SELECT 1 FROM roles WHERE role = 'DepHead');
INSERT INTO roles (role)
SELECT 'mo' WHERE NOT EXISTS (SELECT 1 FROM roles WHERE role = 'mo');
INSERT INTO roles (role)
SELECT 'mec' WHERE NOT EXISTS (SELECT 1 FROM roles WHERE role = 'mec');
INSERT INTO roles (role)
SELECT 'superAdmin' WHERE NOT EXISTS (SELECT 1 FROM roles WHERE role = 'superAdmin');

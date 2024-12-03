package com.yml.icas;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yml.icas.hr.HR;
import com.yml.icas.hr.HRRepository;
import com.yml.icas.model.Member;
import com.yml.icas.model.MemberRegistration;
import com.yml.icas.model.Role;
import com.yml.icas.model.SchemeData;
import com.yml.icas.repository.MemberRegistrationRepo;
import com.yml.icas.repository.MemberRepo;
import com.yml.icas.repository.RoleRepo;
import com.yml.icas.repository.SchemeDataRepo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.*;

@Slf4j
@SpringBootApplication
@EnableAsync
public class MemberApplication {
    public static void main(String[] args) {
        SpringApplication.run(MemberApplication.class, args);
    }

    @Bean
    CommandLineRunner runner(HRRepository hrRepository, MemberRepo memberRepo, MemberRegistrationRepo memberRegistrationRepo,
                             SchemeDataRepo schemeDataRepo, RoleRepo roleRepo) {
        return args -> {
            if (hrRepository.count() == 0) {
                HR saman = new HR();
                saman.setEmpNo("100");
                saman.setName("Mrs DA Leena Perera");
                saman.setAddress("Open University, Nawala, Nugegoda");
                saman.setEmail("daper@ou.ac.lk");
                saman.setContactNo("0714396100");
                saman.setCivilStatus("Married");
                saman.setNic("773661100v");
                saman.setSex("Female");
                saman.setDob(new Date(77, 01, 01));
                saman.setDesignation("Clerk");
                saman.setDepartment("General Administration Division");
                saman.setPhotoUrl("");

                HR kamal = new HR();
                kamal.setEmpNo("101");
                kamal.setName("Kamal PSR");
                kamal.setAddress("101, Nawala Para, Nugegoda");
                kamal.setEmail("101kamal@gmail.com");
                kamal.setContactNo("0714396101");
                kamal.setCivilStatus("Married");
                kamal.setNic("773661101v");
                kamal.setSex("Male");
                kamal.setDob(new Date(85, 02, 01));
                kamal.setDesignation("Lab Assistant");
                kamal.setDepartment("Electrical & Computer");
                kamal.setPhotoUrl("");

                HR wasantha = new HR();
                wasantha.setEmpNo("102");
                wasantha.setName("Wasantha RSR");
                wasantha.setAddress("102, Nawala, Nugegoda");
                wasantha.setEmail("102wasantha@gmail.com");
                wasantha.setContactNo("0714396102");
                wasantha.setCivilStatus("Married");
                wasantha.setNic("773661102v");
                wasantha.setSex("Male");
                wasantha.setDob(new Date(65, 03, 01));
                wasantha.setDesignation("Labour");
                wasantha.setDepartment("Electrical & Computer");
                wasantha.setPhotoUrl("");

                HR lal = new HR();
                lal.setEmpNo("103");
                lal.setName("Lal Karunasinghe GWD");
                lal.setAddress("103, Nawala, Nugegoda");
                lal.setEmail("103lal@gmail.com");
                lal.setContactNo("0714396103");
                lal.setCivilStatus("Married");
                lal.setNic("773661103v");
                lal.setSex("Male");
                lal.setDob(new Date(90, 04, 01));
                lal.setDesignation("Lecturer");
                lal.setDepartment("Textile & appereal");
                lal.setPhotoUrl("");

                HR amila = new HR();
                amila.setEmpNo("104");
                amila.setName("Amila Amarakoon W");
                amila.setAddress("104/a, Mahaweediya, Balangoda");
                amila.setEmail("104amila@gmail.com");
                amila.setContactNo("0714396104");
                amila.setCivilStatus("Married");
                amila.setNic("825580104v");
                amila.setSex("Male");
                amila.setDob(new Date(94, 04, 01));
                amila.setDesignation("Clerk");
                amila.setDepartment("Finance Department");
                amila.setPhotoUrl("");

                HR Neela = new HR();
                Neela.setEmpNo("105");
                Neela.setName("Neela Malkanthi ABC");
                Neela.setAddress("105/a, Narammala, Alawwa");
                Neela.setEmail("105neela@gmail.com");
                Neela.setContactNo("0714396105");
                Neela.setCivilStatus("Married");
                Neela.setNic("810558105v");
                Neela.setSex("Female");
                Neela.setDob(new Date(94, 04, 01));
                Neela.setDesignation("Clerk");
                Neela.setDepartment("Botany Department");
                Neela.setPhotoUrl("");

                HR aruni = new HR();
                aruni.setEmpNo("106");
                aruni.setName("aruni Thilakalatha PGD");
                aruni.setAddress("106/a, Malwala, Rathnapura");
                aruni.setEmail("106aruni@gmail.com");
                aruni.setContactNo("0714396106");
                aruni.setCivilStatus("Married");
                aruni.setNic("810558106v");
                aruni.setSex("Female");
                aruni.setDob(new Date(92, 04, 01));
                aruni.setDesignation("Labour");
                aruni.setDepartment("Education Department");
                aruni.setPhotoUrl("");

                HR asitha = new HR();
                asitha.setEmpNo("107");
                asitha.setName("asitha Kumburegedara ASV");
                asitha.setAddress("107/a, Bambalapitiya, Colombo");
                asitha.setEmail("107asitha@gmail.com");
                asitha.setContactNo("0714396107");
                asitha.setCivilStatus("Married");
                asitha.setNic("810558107v");
                asitha.setSex("Male");
                asitha.setDob(new Date(90, 04, 01));
                asitha.setDesignation("Labour");
                asitha.setDepartment("Education Department");
                asitha.setPhotoUrl("");

                HR dar = new HR();
                dar.setEmpNo("108");
                dar.setName("Dharshana Kumara ATD");
                dar.setAddress("108/a, Wallawatta, Colombo");
                dar.setEmail("108dharshana@gmail.com");
                dar.setContactNo("0714396108");
                dar.setCivilStatus("Married");
                dar.setNic("810558108v");
                dar.setSex("Male");
                dar.setDob(new Date(75, 03, 01));
                dar.setDesignation("Development Officer");
                dar.setDepartment("Education Department");
                dar.setPhotoUrl("");

                HR kapila = new HR();
                kapila.setEmpNo("109");
                kapila.setName("Kapila Lal KEW");
                kapila.setAddress("109/a, Athurugiriya, Colombo");
                kapila.setEmail("109kapila@gmail.com");
                kapila.setContactNo("0714396109");
                kapila.setCivilStatus("Married");
                kapila.setNic("810558109v");
                kapila.setSex("Male");
                kapila.setDob(new Date(75, 03, 01));
                kapila.setDesignation("Development Officer");
                kapila.setDepartment("Education Department");
                kamal.setPhotoUrl("");

                HR darmadasa = new HR();
                darmadasa.setEmpNo("110");
                darmadasa.setName("Dr.LSk Udugama");
                darmadasa.setAddress("110/a, Wallawatta, Colombo");
                darmadasa.setEmail("udugama@ou.ac.lk");
                darmadasa.setContactNo("0714396110");
                darmadasa.setCivilStatus("Married");
                darmadasa.setNic("810558110v");
                darmadasa.setSex("Male");
                darmadasa.setDob(new Date(75, 03, 01));
                darmadasa.setDesignation("Senior Lecture");
                darmadasa.setDepartment("Electrical & Computer");
                darmadasa.setPhotoUrl("");

                HR darmadasa111 = new HR();
                darmadasa111.setEmpNo("111");
                darmadasa111.setName("Dharshana Kumara KMS");
                darmadasa111.setAddress("110/a, Wallawatta, Colombo");
                darmadasa111.setEmail("udugama@ou.ac.lk");
                darmadasa111.setContactNo("0714396110");
                darmadasa111.setCivilStatus("Married");
                darmadasa111.setNic("810550110v");
                darmadasa111.setSex("Male");
                darmadasa111.setDob(new Date(75, 03, 01));
                darmadasa111.setDesignation("KKS");
                darmadasa111.setDepartment("Textile & appereal");
                darmadasa111.setPhotoUrl("");

                HR x = new HR();
                x.setEmpNo("112");
                x.setName("x Kumara KMS");
                x.setAddress("110/a, Wallawatta, Colombo");
                x.setEmail("udugama@ou.ac.lk");
                x.setContactNo("0714396110");
                x.setCivilStatus("Married");
                x.setNic("850558110v");
                x.setSex("Male");
                x.setDob(new Date(75, 03, 05));
                x.setDesignation("KKS");
                x.setDepartment("Botany Department");
                x.setPhotoUrl("");

                HR wasana = new HR();
                wasana.setEmpNo("113");
                wasana.setName("wasana Kumara KMS");
                wasana.setAddress("110/a, Wallawatta, Colombo");
                wasana.setEmail("udugama@ou.ac.lk");
                wasana.setContactNo("0714396110");
                wasana.setCivilStatus("Married");
                wasana.setNic("910558110v");
                wasana.setSex("Male");
                wasana.setDob(new Date(75, 12, 04));
                wasana.setDesignation("KKS");
                wasana.setDepartment("Botany Department");
                wasana.setPhotoUrl("");

                HR perera = new HR();
                perera.setEmpNo("114");
                perera.setName("perera Kumara KMS");
                perera.setAddress("110/a, Wallawatta, Colombo");
                perera.setEmail("udugama@ou.ac.lk");
                perera.setContactNo("0714396110");
                perera.setCivilStatus("Married");
                perera.setNic("810558120v");
                perera.setSex("Male");
                perera.setDob(new Date(75, 03, 01));
                perera.setDesignation("Senior Lecture");
                perera.setDepartment("Education Department");
                perera.setPhotoUrl("");

                HR z = new HR();
                z.setEmpNo("115");
                z.setName("z Kumara KMS");
                z.setAddress("110/a, Wallawatta, Colombo");
                z.setEmail("udugama@ou.ac.lk");
                z.setContactNo("0714396110");
                z.setCivilStatus("Married");
                z.setNic("810558111v");
                z.setSex("Male");
                z.setDob(new Date(76, 03, 01));
                z.setDesignation("KKS");
                z.setDepartment("Botany Department");
                z.setPhotoUrl("");

                HR a = new HR();
                a.setEmpNo("116");
                a.setName("a Kumara KMS");
                a.setAddress("110/a, Wallawatta, Colombo");
                a.setEmail("udugama@ou.ac.lk");
                a.setContactNo("0714396110");
                a.setCivilStatus("Married");
                a.setNic("920558111v");
                a.setSex("Male");
                a.setDob(new Date(76, 03, 30));
                a.setDesignation("KKS");
                a.setDepartment("Botany Department");
                a.setPhotoUrl("");

                HR l = new HR();
                l.setEmpNo("117");
                l.setName("z Kumara KMS");
                l.setAddress("110/a, Wallawatta, Colombo");
                l.setEmail("udugama@ou.ac.lk");
                l.setContactNo("0714396110");
                l.setCivilStatus("Married");
                l.setNic("815558111v");
                l.setSex("Male");
                l.setDob(new Date(76, 03, 01));
                l.setDesignation("KKS");
                l.setDepartment("Botany Department");
                l.setPhotoUrl("");

                HR an = new HR();
                an.setEmpNo("118");
                an.setName("an Kumara KMS");
                an.setAddress("110/a, Wallawatta, Colombo");
                an.setEmail("udugama@ou.ac.lk");
                an.setContactNo("0714396110");
                an.setCivilStatus("Married");
                an.setNic("810558111v");
                an.setSex("Male");
                an.setDob(new Date(76, 03, 01));
                an.setDesignation("KKS");
                an.setDepartment("Botany Department");
                an.setPhotoUrl("");

                HR momo = new HR();
                momo.setEmpNo("119");
                momo.setName("momo Kumara KMS");
                momo.setAddress("110/a, Wallawatta, Colombo");
                momo.setEmail("udugama@ou.ac.lk");
                momo.setContactNo("0714396110");
                momo.setCivilStatus("Married");
                momo.setNic("810058111v");
                momo.setSex("Male");
                momo.setDob(new Date(76, 03, 01));
                momo.setDesignation("Senior Lecture");
                momo.setDepartment("Botany Department");
                momo.setPhotoUrl("");

                HR k = new HR();
                k.setEmpNo("120");
                k.setName("z Kumara KMS");
                k.setAddress("110/a, Wallawatta, Colombo");
                k.setEmail("lakshakumara@gmail.com");
                k.setContactNo("0714396110");
                k.setCivilStatus("Married");
                k.setNic("930558111v");
                k.setSex("Male");
                k.setDob(new Date(76, 03, 01));
                k.setDesignation("KKS");
                k.setDepartment("Finance Department");
                k.setPhotoUrl("");

                HR amali = new HR();
                amali.setEmpNo("121");
                amali.setName("z Kumara KMS");
                amali.setAddress("110/a, Wallawatta, Colombo");
                amali.setEmail("110dharmadasa@gmail.com");
                amali.setContactNo("0714396110");
                amali.setCivilStatus("Married");
                amali.setNic("940558111v");
                amali.setSex("Male");
                amali.setDob(new Date(76, 03, 01));
                amali.setDesignation("Cleark");
                amali.setDepartment("Finance Department");
                amali.setPhotoUrl("");

                hrRepository.save(saman);
                hrRepository.save(kamal);
                hrRepository.save(wasantha);
                hrRepository.save(lal);
                hrRepository.save(amila);
                hrRepository.save(Neela);
                hrRepository.save(aruni);
                hrRepository.save(asitha);
                hrRepository.save(dar);
                hrRepository.save(kapila);
                hrRepository.save(darmadasa);
                hrRepository.save(darmadasa111);
                hrRepository.save(x);
                hrRepository.save(wasana);
                hrRepository.save(perera);
                hrRepository.save(z);
                hrRepository.save(a);
                hrRepository.save(l);
                hrRepository.save(an);
                hrRepository.save(momo);
                hrRepository.save(k);
                hrRepository.save(amali);

                Member mr = new Member();
                mr.setEmpNo(saman.getEmpNo());
                mr.setName(saman.getName());
                mr.setAddress(saman.getAddress());
                mr.setEmail(saman.getEmail());
                mr.setContactNo(saman.getContactNo());
                mr.setCivilStatus(saman.getCivilStatus());
                mr.setNic(saman.getNic());
                mr.setSex(saman.getSex());
                mr.setDob(saman.getDob());
                mr.setDesignation(saman.getDesignation());
                mr.setDepartment(saman.getDepartment());
                mr.setPassword("admin");
                mr.setMDate(new java.util.Date());
                mr.setStatus("sudo");
                mr.setDeleted(false);
                /*Set<Role> roles = new HashSet<>();
                roles.add(roleRepo.findByRole("user"));
                roles.add(roleRepo.findByRole("admin"));
                mr.getRoles().addAll(roles);*/
                Member newm = memberRepo.save(mr);

                MemberRegistration mreg = new MemberRegistration();
                mreg.setMember(newm);
                mreg.setYear(2024);
                mreg.setAcceptedDate(new java.util.Date());
                mreg.setAcceptedBy(1);
                mreg.setSchemeType("Individual");
                memberRegistrationRepo.save(mreg);
            }
            if (schemeDataRepo.count() == 0) {
                ObjectMapper mapper = new ObjectMapper();
                TypeReference<List<SchemeData>> typeReference = new TypeReference<>() {
                };
                InputStream inputStream = TypeReference.class.getResourceAsStream("/schemeData.json");
                try {
                    List<SchemeData> users = mapper.readValue(inputStream, typeReference);
                    schemeDataRepo.saveAll(users);
                } catch (IOException e) {
                    System.out.println("Unable to save users: " + e.getMessage());
                }
            }
            System.out.println("Configuration done");

            ///System.out.println(guestService.memberValidation(2024,"100"));
        };
    }

    @Bean
    public CorsFilter corsFilter() {
        final CorsConfiguration config = new CorsConfiguration();
        // Don't do this in production, use a proper list  of allowed origins
        config.setAllowedOrigins(Collections.singletonList("*"));
        config.setAllowedHeaders(Arrays.asList("Origin", "Content-Type", "Accept", "Requester-Type"));
        config.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "OPTIONS", "DELETE", "PATCH"));
        config.addExposedHeader("X-Get-Header");

        final UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", config);
        //CorsConfigurationSource source = request -> null
        return new CorsFilter(source);
    }
}

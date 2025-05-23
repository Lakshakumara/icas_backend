package com.yml.icas.control;

import com.yml.icas.repository.MemberRepo;
import com.yml.icas.service.DownloadServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@Slf4j
@RestController
public class DownloadRestImpl implements DownloadRest {
    @Autowired
    MemberRepo memberRepo;
    @Autowired
    DownloadServiceImpl downloadService;

    @Override
    public ResponseEntity<byte[]> downloadClaimApplication(Integer claimId) {
        log.info("downloadOPDApplication {}", claimId);
        try {
            return downloadService.downloadClaimApplication(claimId);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public ResponseEntity<byte[]> downloadApplication(Integer year, String empNo) {
        try {
            log.info("downloadApplication");
            return downloadService.downloadApplication(year, empNo);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public ResponseEntity<InputStreamResource> downloadScheme(Integer year) throws IOException {
        ClassPathResource pdfFile = new ClassPathResource("static/scheme_"+year+".pdf");

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=scheme.pdf")
                .contentType(MediaType.APPLICATION_PDF)
                .contentLength(pdfFile.contentLength())
                .body(new InputStreamResource(pdfFile.getInputStream()));
    }

    @Override
    public ResponseEntity<byte[]> downloadVoucher(long voucherId) {
        try {
            HttpHeaders headers = new HttpHeaders();
            //set the PDF format
            headers.setContentType(MediaType.APPLICATION_PDF);
            headers.setContentDispositionFormData("filename", "Voucher" + ".pdf");
            return new ResponseEntity<>(downloadService.downloadVoucher(voucherId), headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}

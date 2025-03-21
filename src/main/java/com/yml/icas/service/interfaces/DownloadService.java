package com.yml.icas.service.interfaces;

import org.springframework.http.ResponseEntity;

public interface DownloadService {
    ResponseEntity<byte[]> downloadApplication(Integer year, String empNo);

    ResponseEntity<byte[]> downloadClaimApplication(Integer claimId);

    byte[] downloadVoucher(long voucherId);
}

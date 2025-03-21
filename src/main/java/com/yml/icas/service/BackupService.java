package com.yml.icas.service;

import org.springframework.stereotype.Service;
import java.io.BufferedReader;
import java.io.InputStreamReader;

@Service
public class BackupService {

    public void backupDatabase() {
        try {
            ProcessBuilder processBuilder = new ProcessBuilder("C:\\path\\to\\backup.bat");
            Process process = processBuilder.start();

            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }

            int exitCode = process.waitFor();
            if (exitCode == 0) {
                System.out.println("Backup successful");
            } else {
                System.out.println("Backup failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
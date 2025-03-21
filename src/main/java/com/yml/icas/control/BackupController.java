package com.yml.icas.control;

import com.yml.icas.service.BackupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/backup")
public class BackupController {

    @Autowired
    private BackupService backupService;

    @GetMapping("/initiate")
    public String backupDatabase() {
        backupService.backupDatabase();
        return "Backup initiated";
    }
}

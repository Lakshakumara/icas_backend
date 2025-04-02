package com.yml.icas.control;

import lombok.Data;

import java.util.Set;

@Data
class UserDTO {
    private String empNo;
    private String password;
    private Set<String> roles;
}

@Data
class PasswordDTO {
    private String newPassword;
}
@Data
class RolesDTO {
    private Set<String> roles;
}
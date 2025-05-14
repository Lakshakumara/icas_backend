package com.yml.icas.control;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResetForgottenPasswordRequest {
    private String token;
    private String newPassword;
}

package com.yml.icas.dto;

import lombok.Getter;

@Getter
public class MessageResponse {
    private boolean success;
    private final String message;
    public MessageResponse(String message) {
        this.message = message;
    }
    public MessageResponse(boolean success, String message) {
        this.success = success;
        this.message = message;
    }
}

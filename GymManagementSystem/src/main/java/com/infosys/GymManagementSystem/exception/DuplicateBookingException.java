package com.infosys.GymManagementSystem.exception;

public class DuplicateBookingException extends RuntimeException {
    private static final long serialVersionUID = 1L;

    public DuplicateBookingException(String message) {
        super(message);
    }
}

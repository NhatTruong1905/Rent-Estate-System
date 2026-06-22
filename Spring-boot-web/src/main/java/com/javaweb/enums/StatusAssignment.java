package com.javaweb.enums;

public enum StatusAssignment {
    CHUA_XU_LY("Chưa xử lý"),
    DANG_XU_LY("Đang xử lý"),
    DA_XU_LY("Đã xử lý");

    private String status;

    StatusAssignment(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }


}

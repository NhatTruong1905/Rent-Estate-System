package com.javaweb.enums;

import java.util.ArrayList;
import java.util.List;

public enum Status {
    CHUA_XU_LY("Chưa xử lý"),
    DANG_XU_LY("Đang xử lý"),
    DA_XU_LY("Đã xử lý");

    private String status;

    Status(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public static List<String> getListOfStatus() {
        List<String> list = new ArrayList<>();
        for (Status s : Status.values()) {
            list.add(s.getStatus());
        }
        return list;
    }

    public static boolean hasStatusAssignment(String status) {
        for (Status s : Status.values()) {
            if (s.getStatus().equals(status)) {
                return true;
            }
        }
        return false;
    }

    public static Status getValueByKey(String status) {
        Status result = null;
        for (Status s : Status.values()) {
            if (s.getStatus().equals(status)) {
                result = s;
            }
        }
        return result;
    }
}

package com.javaweb.enums;

import java.util.LinkedHashMap;
import java.util.Map;

public enum District {
    QUAN_1("Quận 1"),
    QUAN_3("Quận 3"),
    QUAN_4("Quận 4"),
    QUAN_5("Quận 5"),
    QUAN_6("Quận 6"),
    QUAN_7("Quận 7"),
    QUAN_8("Quận 8"),
    QUAN_9("Quận 9"),
    QUAN_10("Quận 10"),
    QUAN_11("Quận 11"),
    QUAN_12("Quận 12"),
    THANH_PHO_THU_DUC("TP Thủ Đức"),
    QUAN_BINH_TAN("Quận Bình Tân"),
    QUAN_TAN_BINH("Quận Tân Bình"),
    QUAN_GO_VAP("Quận Gò Vấp"),
    QUAN_PHU_NHUAN("Quận Phú Nhuận"),
    QUAN_TAN_PHU("Quận Tân Phú"),
    QUAN_BINH_THANH("Quận Bình Thạnh");

    private String districtName;

    District(String districName) {
        this.districtName = districName;
    }

    public String getDistrictName() {
        return this.districtName;
    }

    public static Map<String, String> getDistricts() {
        Map<String, String> district = new LinkedHashMap<>();
        for (District item : District.values()) {
            district.put(item.toString(), item.getDistrictName());
        }

        return district;
    }

    public static String getDistrictNameByKey(String keyDistrict) {
        if (keyDistrict == null) return "";
        for (District item : District.values()) {
            if (item.toString().toLowerCase().trim().equals(keyDistrict.toLowerCase().trim())) {
                return item.getDistrictName();
            }
        }

        return keyDistrict;
    }
}

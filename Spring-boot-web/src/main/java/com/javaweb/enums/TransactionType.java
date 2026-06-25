package com.javaweb.enums;

import java.util.ArrayList;
import java.util.List;

public enum TransactionType {
    CSKH("Chăm sóc khách hàng"),
    DDX("Dẫn đi xem nhà");

    private String transactionType;

    TransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    public String getTransactionType() {
        return transactionType;
    }

    public static List<String> getListOfTransactionType() {
        List<String> transactionTypeList = new ArrayList<>();
        for (TransactionType transactionType : TransactionType.values()) {
            transactionTypeList.add(transactionType.getTransactionType());
        }

        return transactionTypeList;
    }
}

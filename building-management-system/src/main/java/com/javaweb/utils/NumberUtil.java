package com.javaweb.utils;

public class NumberUtil {
	public static boolean checkNumber(String value) {
		try {
			Long num = Long.parseLong(value);
		} catch (Exception e) {
			return false;
		}

		return true;
	}
}

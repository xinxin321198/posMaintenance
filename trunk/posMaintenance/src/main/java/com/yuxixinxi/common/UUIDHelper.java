package com.yuxixinxi.common;

import java.util.UUID;

public class UUIDHelper {

	public static String getUUID() {
		return UUID.randomUUID().toString().replaceAll("\\-", "");
	}
}

package com.zero.auth.kit;

import java.security.MessageDigest;

public class EncryptKit {

    // SHA-256加密
    public static String sha256(final String text) {
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
            byte[] bytes = messageDigest.digest(text.getBytes());
            StringBuilder hexValue = new StringBuilder();
            for (byte b : bytes) {
                //将其中的每个字节转成十六进制字符串：byte类型的数据最高位是符号位，通过和0xff进行与操作，转换为int类型的正整数。
                String hexString = Integer.toHexString(b & 0xff);
                hexValue.append(hexString.length() == 1 ? "0" + hexString : hexString);
            }
            return hexValue.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }


}

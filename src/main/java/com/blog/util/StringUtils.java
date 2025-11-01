package com.blog.util;

public class StringUtils {

    public static boolean isEmpty(String str) {
        return str == null || str.trim().length() == 0;
    }

    public static boolean isNotEmpty(String str) {
        return !isEmpty(str);
    }

    public static String escapeHtml(String content) {
        if (isEmpty(content)) {
            return "";
        }
        return content.replaceAll("<", "&lt;")
                .replaceAll(">", "&gt;")
                .replaceAll("\"", "&quot;")
                .replaceAll("'", "&#39;");
    }

    public static String truncate(String str, int length) {
        if (isEmpty(str)) {
            return "";
        }
        if (str.length() <= length) {
            return str;
        }
        return str.substring(0, length) + "...";
    }
}
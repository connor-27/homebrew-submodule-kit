package com.kakaoent.fanz.support.database.enum

enum class ContentTypeCode(
    val projectCode: Int,
    val projectName: String,
    val projectServiceCode: Int,
    val projectServiceName: String
) {
    FANZ_108(100, "FANZ", 108, "댓글"),
    FANZ_103(100, "FANZ", 103, "미디어"),
    FANZ_102(100, "FANZ", 102, "포스트"),
    FANZ_101(100, "FANZ", 101, "아티스트"),

    companion object {
        fun fromProjectServiceCode(code: Int): ContentTypeCode? {
            return values().find { it.projectServiceCode == code }
        }
    }
}

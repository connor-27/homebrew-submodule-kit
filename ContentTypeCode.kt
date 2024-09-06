package com.kakaoent.fanz.support.database.enum

/**
 * ContentTypeCode
 * - [CmtContext] 의 필드명을 그대로 enum 에 적용함
 * - [ContentTypeCode.projectServiceCode] -> fanz 서비스에서는 contentTypeCode 임
 */
enum class ContentTypeCode(
    val projectCode: Int,
    val projectName: String,
    val projectServiceCode: Int,
    val projectServiceName: String
) {
    FANZ_112(100, "FANZ", 112, "라이브챗-아티스트"),
    FANZ_111(100, "FANZ", 111, "라이브챗-유저"),
    FANZ_108(100, "FANZ", 108, "댓글"),
    FANZ_104(100, "FANZ", 104, "유저"),
    FANZ_103(100, "FANZ", 103, "미디어"),
    FANZ_102(100, "FANZ", 102, "포스트"),
    FANZ_101(100, "FANZ", 101, "아티스트");

    companion object {
        fun fromProjectServiceCode(code: Int): ContentTypeCode? {
            return values().find { it.projectServiceCode == code }
        }
    }
}

abstract class ApiUrls {
  static final baseURL = "https://dev.api.kursol.uz/kursol-api/";
  static final resetPassword = "${baseURL}v1/auth/reset-password";
  static final resetPasswordPhone = "${baseURL}v1/auth/reset-password/phone";
  static final resetPasswordEmail = "${baseURL}v1/auth/reset-password/email";
  static final logout = "${baseURL}v1/auth/logout";
  static final login = "${baseURL}v1/auth/login";
  static final registerEmail = "v1/auth/register/email";
  static final registerPhone = "v1/auth/register/phone";
}

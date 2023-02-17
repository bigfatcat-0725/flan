class RegExpConstants {
  static final RegExp email = RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\])|(([a-zA-Z\-\d]+\.)+[a-zA-Z]{2,}))$'); // 이메일
  static final RegExp passwordRegExp1 =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d\w\W]{8,}$'); // 문자, 숫자
  static final RegExp passwordRegExp2 = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$'); // 문자, 숫자, 특수문자
  static final RegExp passwordRegExp3 =
      RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$'); // 대문자, 소문자, 숫자
  static final RegExp passwordRegExp4 = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$'); // 대문자, 소문자, 숫자, 특수문자
}

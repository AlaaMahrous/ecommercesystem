class AppLinks {
  static const String server = "http://192.168.1.8/ecommerce";

  //================ Auth ==================//
  static const String signup = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifycodesignup = "$server/auth/verifycode.php";

  //================ ForgetPassword ==================//
  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycodereset = "$server/forgetpassword/verifycode.php";

  //================ Categories ==================//
  static const String categoriesview = "$server/categories/view.php";

  //================ Items ==================//
  static const String itemsview = "$server/items/view.php";
}

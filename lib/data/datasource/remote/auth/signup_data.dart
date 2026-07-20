import 'package:ecommercesystem/core/class/crud.dart';
import 'package:ecommercesystem/core/constant/app_links.dart';

class SignupData {
  SignupData(this.crud);
  Crud crud;
  Future postData(
    String username,
    String password,
    String email,
    String phone,
  ) async {
    var response = await crud.postData(AppLinks.signup, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}

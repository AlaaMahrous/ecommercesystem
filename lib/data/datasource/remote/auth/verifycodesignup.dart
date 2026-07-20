import 'package:ecommercesystem/core/class/crud.dart';
import 'package:ecommercesystem/core/constant/app_links.dart';

class VerifycodesignupData {
  VerifycodesignupData(this.crud);
  Crud crud;
  Future postData(String email, String password) async {
    var response = await crud.postData(AppLinks.login, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}

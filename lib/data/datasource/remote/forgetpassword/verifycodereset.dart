import 'package:ecommercesystem/core/class/crud.dart';
import 'package:ecommercesystem/core/constant/app_links.dart';

class VerifycoderesetData {
  VerifycoderesetData(this.crud);
  Crud crud;
  Future postData(String email, String verifycode) async {
    var response = await crud.postData(AppLinks.verifycodereset, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}

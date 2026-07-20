import 'package:ecommercesystem/core/class/crud.dart';
import 'package:ecommercesystem/core/constant/app_links.dart';

class CheckemailData {
  CheckemailData(this.crud);
  Crud crud;
  Future postData(String email) async {
    var response = await crud.postData(AppLinks.checkemail, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}

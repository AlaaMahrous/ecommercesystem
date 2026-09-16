import 'package:ecommercesystem/core/class/crud.dart';
import 'package:ecommercesystem/core/constant/app_links.dart';

class ItemCategoryView {
  ItemCategoryView(this.crud);
  Crud crud;
  Future postData(String id) async {
    var response = await crud.postData(AppLinks.itemscategorview, {
      "id": id.toString(),
      "userid": '17',
    });
    return response.fold((l) => l, (r) => r);
  }
}

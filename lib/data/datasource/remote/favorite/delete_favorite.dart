import 'package:ecommercesystem/core/class/crud.dart';
import 'package:ecommercesystem/core/constant/app_links.dart';

class DeleteFavorite {
  DeleteFavorite(this.crud);
  Crud crud;
  Future postData(String id) async {
    var response = await crud.postData(AppLinks.favoritedelete, {
      "itemid": id.toString(),
      "userid": '17',
    });
    return response.fold((l) => l, (r) => r);
  }
}

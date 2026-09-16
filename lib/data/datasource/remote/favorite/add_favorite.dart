import 'package:ecommercesystem/core/class/crud.dart';
import 'package:ecommercesystem/core/constant/app_links.dart';

class AddFavorite {
  AddFavorite(this.crud);
  Crud crud;
  Future postData(String id) async {
    var response = await crud.postData(AppLinks.favoriteadd, {
      "itemid": id.toString(),
      "userid": '17',
    });
    return response.fold((l) => l, (r) => r);
  }
}

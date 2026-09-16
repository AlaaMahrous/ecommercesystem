import 'package:ecommercesystem/core/class/crud.dart';
import 'package:ecommercesystem/core/constant/app_links.dart';

class GetFavorite {
  GetFavorite(this.crud);
  Crud crud;
  Future postData() async {
    var response = await crud.postData(AppLinks.favoriteview, {"userid": '17'});
    return response.fold((l) => l, (r) => r);
  }
}

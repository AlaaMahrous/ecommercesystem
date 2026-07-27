import 'package:ecommercesystem/core/class/crud.dart';
import 'package:ecommercesystem/core/constant/app_links.dart';

class CategoriesData {
  CategoriesData(this.crud);
  Crud crud;
  Future postData() async {
    var response = await crud.postData(AppLinks.categoriesview, {});
    return response.fold((l) => l, (r) => r);
  }
}

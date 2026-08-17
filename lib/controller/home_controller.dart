import 'dart:developer';

import 'package:ecommercesystem/core/class/status_request.dart';
import 'package:ecommercesystem/core/functions/handling_data.dart';
import 'package:ecommercesystem/core/services/services.dart';
import 'package:ecommercesystem/data/datasource/remote/home/categories.dart';
import 'package:ecommercesystem/data/datasource/remote/home/items.dart';
import 'package:ecommercesystem/data/model/category_model.dart';
import 'package:ecommercesystem/data/model/item_model.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  void initialData();
  Future<void> getCategoriesData();
  Future<void> getItemsData();
}

class HomeControllerImp extends HomeController {
  Services services = Get.find();
  /*          category          */
  CategoriesData categoriesData = CategoriesData(Get.find());
  StatusRequest catStatusRequest = StatusRequest.initial;
  List<CategoryModel> categoryList = [];
  /*          Item            */
  ItemsData itemsData = ItemsData(Get.find());
  StatusRequest itStatusRequest = StatusRequest.initial;
  List<ItemModel> itemsList = [];

  String? username;

  @override
  void initialData() {
    username = services.sharedPreferences.getString("user_name");
  }

  @override
  void onInit() {
    initialData();
    getCategoriesData();
    getItemsData();
    super.onInit();
  }

  @override
  Future<void> getCategoriesData() async {
    catStatusRequest = StatusRequest.loading;
    await Future.delayed(const Duration(seconds: 2));
    var response = await categoriesData.postData();
    log("============== Controller $response");
    catStatusRequest = handlingData(response);
    if (StatusRequest.success == catStatusRequest) {
      if (response['status'] == "success") {
        categoryList = (response['data'] as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
      }
    }
    update();
  }

  @override
  Future<void> getItemsData() async {
    itStatusRequest = StatusRequest.loading;
    await Future.delayed(const Duration(seconds: 2));
    var response = await itemsData.postData();
    log("============== Controller $response");
    itStatusRequest = handlingData(response);
    if (StatusRequest.success == itStatusRequest) {
      if (response['status'] == "success") {
        itemsList = (response['data'] as List)
            .map((e) => ItemModel.fromJson(e))
            .toList();
      }
    }
    update();
  }
}

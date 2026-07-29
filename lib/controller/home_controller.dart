import 'dart:developer';

import 'package:ecommercesystem/core/class/status_request.dart';
import 'package:ecommercesystem/core/functions/handling_data.dart';
import 'package:ecommercesystem/core/services/services.dart';
import 'package:ecommercesystem/data/datasource/remote/home/categories.dart';
import 'package:ecommercesystem/data/model/category_model.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  void initialData();
  Future<void> getCategoriesData();
  Future<void> getItemsData();
}

class HomeControllerImp extends HomeController {
  CategoriesData categoriesData = CategoriesData(Get.find());
  StatusRequest statusRequest = StatusRequest.initial;
  Services services = Get.find();
  List<CategoryModel> categoryList = [];
  String? username;

  @override
  void initialData() {
    username = services.sharedPreferences.getString("user_name");
  }

  @override
  void onInit() {
    initialData();
    getCategoriesData();
    super.onInit();
  }

  @override
  Future<void> getCategoriesData() async {
    statusRequest = StatusRequest.loading;
    await Future.delayed(const Duration(seconds: 2));
    var response = await categoriesData.postData();
    log("============== Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
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
    statusRequest = StatusRequest.loading;
    await Future.delayed(const Duration(seconds: 2));
    var response = await categoriesData.postData();
    log("============== Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categoryList = (response['data'] as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
      }
    }
    update();
  }
}

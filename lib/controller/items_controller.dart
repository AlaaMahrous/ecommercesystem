import 'dart:developer';

import 'package:ecommercesystem/core/class/status_request.dart';
import 'package:ecommercesystem/core/functions/handling_data.dart';
import 'package:ecommercesystem/data/datasource/remote/item_category_view.dart';
import 'package:ecommercesystem/data/model/category_model.dart';
import 'package:ecommercesystem/data/model/item_model.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  void getItems();
}

class ItemsControllerImpl extends ItemsController {
  ItemsControllerImpl({required this.category});

  final CategoryModel category;
  StatusRequest statusRequest = StatusRequest.initial;
  ItemCategoryView itemsData = ItemCategoryView(Get.find());
  List<ItemModel> itemsList = [];

  @override
  void onInit() {
    getItems();
    super.onInit();
  }

  @override
  void getItems() async {
    statusRequest = StatusRequest.loading;
    var response = await itemsData.postData(category.categoryId.toString());
    log("============== Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        itemsList = (response['data'] as List)
            .map((e) => ItemModel.fromJson(e))
            .toList();
      }
    }
    update();
  }
}

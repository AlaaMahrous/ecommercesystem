import 'dart:developer';

import 'package:ecommercesystem/core/class/status_request.dart';
import 'package:ecommercesystem/core/functions/handling_data.dart';
import 'package:ecommercesystem/data/datasource/remote/favorite/get_favorite.dart';
import 'package:ecommercesystem/data/model/item_model.dart';
import 'package:get/get.dart';

abstract class FavoriteController extends GetxController {
  void getItems();
}

class FavoriteControllerImpl extends FavoriteController {
  StatusRequest statusRequest = StatusRequest.initial;
  GetFavorite itemsData = GetFavorite(Get.find());
  List<ItemModel> itemsList = [];

  @override
  void onInit() {
    getItems();
    super.onInit();
  }

  @override
  void getItems() async {
    statusRequest = StatusRequest.loading;
    var response = await itemsData.postData();
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

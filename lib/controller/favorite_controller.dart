import 'dart:developer';

import 'package:ecommercesystem/core/class/status_request.dart';
import 'package:ecommercesystem/core/functions/handling_data.dart';
import 'package:ecommercesystem/data/datasource/remote/favorite/add_favorite.dart';
import 'package:ecommercesystem/data/datasource/remote/favorite/delete_favorite.dart';
import 'package:ecommercesystem/data/datasource/remote/favorite/get_favorite.dart';
import 'package:ecommercesystem/data/model/item_model.dart';
import 'package:get/get.dart';

abstract class FavoriteController extends GetxController {
  void getItems();
  Future<void> toggleFavorite(ItemModel item);
}

class FavoriteControllerImpl extends FavoriteController {
  StatusRequest statusRequest = StatusRequest.initial;

  GetFavorite itemsData = GetFavorite(Get.find());
  AddFavorite addFavorite = AddFavorite(Get.find());
  DeleteFavorite deleteFavorite = DeleteFavorite(Get.find());

  List<ItemModel> itemsList = [];

  @override
  void onInit() {
    getItems();
    super.onInit();
  }

  @override
  void getItems() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await itemsData.postData();

    log("============== Favorite Controller $response");

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

  @override
  Future<void> toggleFavorite(ItemModel item) async {
    // نخزن الحالة القديمة
    final oldValue = item.isFavorite;

    // نحدد العملية المطلوبة
    final response = oldValue
        ? await deleteFavorite.postData(item.itemId.toString())
        : await addFavorite.postData(item.itemId.toString());

    log("========== Favorite Response: $response");

    final requestStatus = handlingData(response);

    if (requestStatus == StatusRequest.success &&
        response['status'] == 'success') {
      // نغير الحالة فقط بعد نجاح الـ backend
      item.isFavorite = !oldValue;

      update();
    } else {
      // لو الـ backend فشل، تفضل الحالة زي ما هي
      log("========== Favorite operation failed");
    }
  }
}

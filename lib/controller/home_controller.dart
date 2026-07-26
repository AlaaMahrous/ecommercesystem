import 'package:ecommercesystem/core/services/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {}

class HomeControllerImp extends HomeController {
  Services services = Get.find();
  String? username;

  void initialData() {
    username = services.sharedPreferences.getString("user_name");
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}

import 'package:get/get.dart';
import 'package:ecommercesystem/core/class/crud.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<Crud>(Crud(), permanent: true);
  }
}

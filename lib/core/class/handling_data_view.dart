import 'package:ecommercesystem/core/class/status_request.dart';
import 'package:ecommercesystem/core/constant/app_lottie.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    switch (statusRequest) {
      case StatusRequest.initial:
        return Center(
          child: Lottie.asset(AppLottie.loading, width: 200, height: 200),
        );
      case StatusRequest.loading:
        return Center(
          child: Lottie.asset(AppLottie.loading, width: 200, height: 200),
        );

      case StatusRequest.offlinefailure:
        return const Center(child: Text("No Internet Connection"));

      case StatusRequest.serverfailure:
        return const Center(child: Text("Server Error"));

      case StatusRequest.failure:
        return const Center(child: Text("No Data Found"));

      case StatusRequest.success:
        return widget;
    }
  }
}

import 'package:ecommercesystem/core/class/status_request.dart';
import 'package:flutter/material.dart';

class HandlingDataView extends StatelessWidget {
  const HandlingDataView({
    super.key,
    required this.statusRequest,
    required this.widget,
  });
  final StatusRequest statusRequest;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(child: Text("Loading.."))
        : statusRequest == StatusRequest.offlinefailure
        ? const Center(child: Text("Offline Failure"))
        : statusRequest == StatusRequest.serverfailure
        ? const Center(child: Text("Server Failure"))
        : statusRequest == StatusRequest.failure
        ? const Center(child: Text("No data"))
        : widget;
  }
}

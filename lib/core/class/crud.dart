import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommercesystem/core/class/status_request.dart';
import 'package:ecommercesystem/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    if (!await checkInternet()) {
      return const Left(StatusRequest.offlinefailure);
    }

    try {
      final response = await http
          .post(Uri.parse(linkurl), body: data)
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = response.body.isNotEmpty ? jsonDecode(response.body) : {};

        return Right(body is Map ? body : {});
      }

      return const Left(StatusRequest.serverfailure);
    } on SocketException {
      return const Left(StatusRequest.offlinefailure);
    } on TimeoutException {
      return const Left(StatusRequest.serverfailure);
    } on FormatException {
      return const Left(StatusRequest.failure);
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }
}

import 'dart:developer';
import 'package:deeplink/model/phone_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final dio = Dio();

  RxList phones = <PhoneModel>[].obs;
  RxBool isProductLoading = false.obs;

  void apiCall() async {
    try {
      isProductLoading.value = true;
      final res = await dio.get("https://api.restful-api.dev/objects");
      log(res.toString());

      if (res.statusCode == 200) {
        final List data = res.data;
        phones.value = data.map((e) => PhoneModel.fromJson(e)).toList();
      }
    } catch (e) {
      debugPrint("error in product apiCall: $e");
    } finally {
      isProductLoading.value = false;
    }
  }

  PhoneModel? getPhoneById(String id) {
    return phones.firstWhereOrNull((p) => p.id == id);
  }
}

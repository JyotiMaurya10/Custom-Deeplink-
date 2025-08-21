import 'package:deeplink/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'phone_detail_screen.dart';

class PhoneListScreen extends StatelessWidget {
  final HomeController controller = Get.find();

  PhoneListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Phones"), centerTitle: true),
      body: Obx(() {
        if (controller.isProductLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.phones.length,
          itemBuilder: (context, index) {
            final phone = controller.phones[index];
            return ListTile(
              title: Text(phone.name),
              subtitle: Text("ID: ${phone.id}"),
              onTap: () {
                Get.to(() => PhoneDetailScreen(phoneId: phone.id));
              },
            );
          },
        );
      }),
    );
  }
}

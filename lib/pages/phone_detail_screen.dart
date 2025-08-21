import 'package:deeplink/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneDetailScreen extends StatelessWidget {
  final String phoneId;

  PhoneDetailScreen({super.key, required this.phoneId});

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final phone = controller.getPhoneById(phoneId);

    if (phone == null) {
      return Scaffold(appBar: AppBar(title: const Text("Phone Detail")), body: const Center(child: Text("Oops, No Phone Found")));
    }

    final detail = phone.phoneDetail;

    return Scaffold(
      appBar: AppBar(title: const Text("Phone Detail"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name: ${phone.name}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text("ID: ${phone.id}", style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),

              if (detail != null) ...[
                if (detail.color != null) Text("Color: ${detail.color}"),
                if (detail.capacity != null) Text("Capacity: ${detail.capacity}"),
                if (detail.capacityGb != null) Text("Capacity GB: ${detail.capacityGb}"),
                if (detail.price != null) Text("Price: \$${detail.price}"),
                if (detail.generation != null) Text("Generation: ${detail.generation}"),
                if (detail.year != null) Text("Year: ${detail.year}"),
                if (detail.cpuModel != null) Text("CPU Model: ${detail.cpuModel}"),
                if (detail.hardDiskSize != null) Text("Hard Disk Size: ${detail.hardDiskSize}"),
                if (detail.caseSize != null) Text("Case Size: ${detail.caseSize}"),
                if (detail.screenSize != null) Text("Screen Size: ${detail.screenSize}\""),
                if (detail.description != null) Text("Description: ${detail.description}"),
              ] else
                const Text("No extra details available"),
            ],
          ),
        ),
      ),
    );
  }
}

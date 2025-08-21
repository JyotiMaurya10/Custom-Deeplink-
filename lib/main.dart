import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:deeplink/bindings/bindings.dart';
import 'package:deeplink/controller/home_controller.dart';
import 'package:deeplink/pages/phone_detail_screen.dart';
import 'package:deeplink/pages/phone_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final HomeController homeController = Get.put(HomeController());
  StreamSubscription<Uri>? linkSubscription; 

  @override
  void initState() {
    super.initState();
    homeController.apiCall();
    initDeepLinks();
  }

  Future<void> initDeepLinks() async {
    linkSubscription = AppLinks().uriLinkStream.listen((uri) {
      debugPrint('onAppLink: $uri');
      openAppLink(uri);
    });
  }

  void openAppLink(Uri uri) {
    if (uri.host == "phone" && uri.pathSegments.isNotEmpty) {
      final phoneId = uri.pathSegments.first;
      Get.to(() => PhoneDetailScreen(phoneId: phoneId));
    }
  }

  @override
  void dispose() {
    linkSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      debugShowCheckedModeBanner: false,
      home: PhoneListScreen(),
      initialBinding: InitialBinding(),
    );
  }
}

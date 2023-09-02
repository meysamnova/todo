import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo/bindings/mybinding.dart';
import 'package:todo/controllers/changethemecontroller.dart';
import 'package:todo/pages/home_page.dart.dart';
import 'package:todo/pages/newtask_page.dart';
import 'package:todo/theme/theme_manager.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ChangeThemecontroller controller = Get.put(ChangeThemecontroller());
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      getPages: [
        GetPage(name: '/homepage', page: () => const HomePage()),
        GetPage(name: '/newtask', page: () => const NewTaskPage()),
      ],
      debugShowCheckedModeBanner: false,
      initialBinding: MyBindings(),
      theme: ThemeConfif.lightTheme,
      darkTheme: ThemeConfif.darkTheme,
      themeMode: controller.isLight.value ? ThemeMode.light : ThemeMode.dark,

      initialRoute: '/homepage',
    );
  }
}

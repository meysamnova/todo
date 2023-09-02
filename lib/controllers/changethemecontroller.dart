import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChangeThemecontroller extends GetxController {
  final box = GetStorage();

  final isLight = true.obs;

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromBox();
  }

  _loadThemeFromBox() {
    if (box.read('theme') != null) {
      isLight.value = box.read('theme');
    }
  }
  toggleTheme() {
    isLight.value = !isLight.value;
    Get.changeThemeMode(isLight.value ? ThemeMode.light : ThemeMode.dark);

    box.write('theme', isLight.value);
  }
}

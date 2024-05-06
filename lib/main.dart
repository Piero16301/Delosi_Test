import 'package:delosi_test/app/app.dart';
import 'package:delosi_test/bootstrap.dart';
import 'package:flutter/material.dart';

const urlAPI = 'https://idego-entregas-dev-eg56fc7lqa-uc.a.run.app';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() => const AppPage());
}

// ============ TO DEPLOY =================
// flutter build web -t lib/main.dart --web-renderer html && firebase deploy

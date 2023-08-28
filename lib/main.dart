import 'package:flutter/material.dart';

import 'app.dart';
import 'dependencie_injection.dart' as sl;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl.init();

  runApp(const FlutterSensorApp());
}

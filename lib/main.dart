import 'package:big_winner_yay/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences globalSharedPreferences;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  globalSharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

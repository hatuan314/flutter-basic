import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:reminders_app/reminders_app/presentation/model/group.dart';
import 'reminders_app/presentation/app.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(GroupAdapter());
  await Hive.openBox<Group>('group');
  runApp(MyApp());
}
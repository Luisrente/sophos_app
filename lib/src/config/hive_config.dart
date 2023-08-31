import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/src/domain/entities/entities.dart';

Future<void> initializeHive() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<Movie>(MovieAdapter());
  await Hive.openBox<Movie>('movies');
}
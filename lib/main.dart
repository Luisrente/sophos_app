import 'package:flutter/material.dart';
import 'src/config/theme/app_theme.dart';
import 'src/presentation/screens/post/post_screen.dart';


void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  const PostScreen(),
      theme: AppTheme().getTheme(),
    );
  }
}

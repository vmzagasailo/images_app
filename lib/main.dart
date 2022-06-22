import 'package:flutter/material.dart';
import 'package:images_app/di/get_it.dart';
import 'package:images_app/presentation/bloc/image/provider.dart';
import 'package:images_app/presentation/screens/home_screen.dart';
import 'package:images_app/presentation/screens/image_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageBlocProvider(
        child: HomeScreen(),
      ),
      routes: {ImageScreen.routeName: (context) => const ImageScreen()},
    );
  }
}

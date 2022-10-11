import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status_saver/Provider/bottom_nav_provider.dart';
import 'package:status_saver/Provider/getStatusProvider.dart';
import 'package:status_saver/Screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => GetStatusProvider()),
      ],
      child: const MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pakmart/SellerCentral/login_seller_screen.dart';
import 'package:pakmart/screens/started/gettingStarted.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const GettingStartedScreen(),
    );
  }
}

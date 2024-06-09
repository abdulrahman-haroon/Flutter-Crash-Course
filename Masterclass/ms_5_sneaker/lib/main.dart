import 'package:flutter/material.dart';
import 'package:ms_5_sneaker/models/cart.dart';
import 'package:ms_5_sneaker/pages/intro_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> Cart() ,
      builder: (context, child) => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage()
    ),
    );
  }
}

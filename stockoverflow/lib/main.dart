import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockoverflow/models/item_model.dart';
import 'package:stockoverflow/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

List<Item> items = [];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_){
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'StockOverflow',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          scaffoldBackgroundColor: const Color(0xFFFEFAF1),
          useMaterial3: true,
        ),
      home: LoginPage()
      ),
    );
  }
}
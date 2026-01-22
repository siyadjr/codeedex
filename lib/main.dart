import 'package:codeedex/modules/auth/controller/auth_provider.dart';
import 'package:codeedex/modules/auth/login_screen.dart';
import 'package:codeedex/modules/home/controller/home_provider.dart';
// ignore: unused_import
import 'package:codeedex/modules/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> AuthProvider()),
        ChangeNotifierProvider(create: (_)=> HomeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Codedex',
        theme: ThemeData(fontFamily: 'Lufga'),
        home: const LoginScreen(),
      ),
    );
  }
}

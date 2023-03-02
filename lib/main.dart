import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_node_auth/features/widgets/bottom_nav.dart';
import 'package:flutter_node_auth/models/stocks.dart';
import 'package:flutter_node_auth/providers/news_provider.dart';
import 'package:flutter_node_auth/providers/userprovider.dart';
import 'package:flutter_node_auth/features/auth/login_screen.dart';
import 'package:flutter_node_auth/services/auth_services.dart';
import 'package:flutter_node_auth/services/stocks_services.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create:(_)=>UserProvider()),
      ChangeNotifierProvider(create:(_)=>NewsProvider()),


    ],
    child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.getUserData(context);
   

  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FinHub',
      
      home: Provider.of<UserProvider>(context).user.token.isEmpty ?   LoginScreen()
       : BottomNav()
    
    );
  }
}


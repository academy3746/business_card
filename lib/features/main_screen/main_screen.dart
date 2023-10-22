import 'package:flutter/material.dart';
import '../../constants/sizes.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "/main";

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.accessibility_new,
          color: Colors.black,
          size: Sizes.size32,
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "살짝 맛이 가버린 개발자 DIO",
          style: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size14,
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
      ),
      body: Container(),
    );
  }
}

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
          "인형 공학의 유일한 권위자, 라이덴쇼군",
          style: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size14,
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(
            Sizes.size24,
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: Sizes.size200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    Sizes.size10,
                  ),
                  child: Image.asset(
                    "assets/images/shogun.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

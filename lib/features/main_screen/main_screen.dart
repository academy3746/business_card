import 'package:business_card/constants/gaps.dart';
import 'package:flutter/material.dart';
import '../../constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "/main";

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController _introduceController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _introduceController = TextEditingController();
  }

  @override
  void dispose() {
    _introduceController.dispose();

    super.dispose();
  }

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
            fontWeight: FontWeight.bold,
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Gaps.v32,

              /// Profile Section
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "이름",
                    style: TextStyle(
                      fontSize: Sizes.size14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.h150,
                  Text("라이덴쇼군"),
                ],
              ),
              Gaps.v14,

              /// Age Section
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "나이",
                    style: TextStyle(
                      fontSize: Sizes.size14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.h150,
                  Text("700"),
                ],
              ),
              Gaps.v14,

              /// Hobby Section
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "취미",
                    style: TextStyle(
                      fontSize: Sizes.size14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.h150,
                  Text("전쟁"),
                ],
              ),
              Gaps.v14,

              /// Job Section
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "직업",
                    style: TextStyle(
                      fontSize: Sizes.size14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.h150,
                  Text("뇌전대장군"),
                ],
              ),
              Gaps.v14,

              /// Education Section
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "학력",
                    style: TextStyle(
                      fontSize: Sizes.size14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.h150,
                  Text("기계공학 박사"),
                ],
              ),
              Gaps.v28,

              /// Introduce Section
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "자기소개",
                    style: TextStyle(
                      fontSize: Sizes.size18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FaIcon(
                    FontAwesomeIcons.penToSquare,
                    size: Sizes.size18,
                  )
                ],
              ),
              Gaps.v10,
              TextField(
                maxLines: 5,
                controller: _introduceController,
                decoration: InputDecoration(
                  hintText: "자기소개를 입력하세요.",
                    border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFFD9D9D9),
                  ),
                  borderRadius: BorderRadius.circular(
                    Sizes.size10,
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

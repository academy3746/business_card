// ignore_for_file: avoid_print
import 'package:business_card/constants/gaps.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  bool _isEditingMode = false;

  void _keyBoardUnfocus() {
    FocusScope.of(context).unfocus();
  }

  Future<void> _getIntroduceData() async {
    var loadPrefs = await SharedPreferences.getInstance();

    String introduceMsg = loadPrefs.getString("temporary").toString();
    _introduceController.text = introduceMsg;
  }

  @override
  void initState() {
    super.initState();

    _getIntroduceData();
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
      backgroundColor: Colors.white,
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
      body: GestureDetector(
        onTap: _keyBoardUnfocus,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(
              Sizes.size24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// MyPhoto Section
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "자기소개",
                      style: TextStyle(
                        fontSize: Sizes.size18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (_isEditingMode == false) {
                          setState(() {
                            _isEditingMode = true;
                          });
                        } else {
                          if (_introduceController.text.isEmpty) {
                            var noticeBar = const SnackBar(
                              content: Text("자기소개를 입력해 주세요."),
                              duration: Duration(
                                seconds: 2,
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(noticeBar);
                            return;
                          }

                          var prefs = await SharedPreferences.getInstance();
                          prefs.setString(
                              "temporary", _introduceController.text);

                          setState(() {
                            _isEditingMode = false;
                          });
                        }
                      },
                      child: FaIcon(
                        FontAwesomeIcons.penToSquare,
                        size: Sizes.size18,
                        color: _isEditingMode == false
                            ? Colors.grey.shade500
                            : Colors.blueAccent,
                      ),
                    )
                  ],
                ),
                Gaps.v10,
                TextField(
                  enabled: _isEditingMode,
                  maxLines: 5,
                  controller: _introduceController,
                  decoration: InputDecoration(
                      hintText: _isEditingMode == false ? null : "자기소개를 입력하세요.",
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
      ),
    );
  }
}

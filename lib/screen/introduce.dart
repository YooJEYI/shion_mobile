import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Introduce extends StatefulWidget {
  const Introduce({super.key});

  @override
  State<Introduce> createState() => _IntroduceState();
}

class _IntroduceState extends State<Introduce>{

  @override
  Widget build(BuildContext context) {
    final tel = Uri.parse('tel:01039396036');
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color> [
                    Color(0xff207dff),
                    Color(0xff00bd55),
                  ]
              )
          ),
        ),
        title: const Text(
          '시온쉼터',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: () async { await launchUrl(tel); }, icon: const Icon(Icons.phone))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: const Image(image: AssetImage("assets/images/sojang.jpg"),),
            ),
            Container(
              margin: EdgeInsets.only(top: 10,left: 10, right: 10),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 5,bottom: 20),
                          child: Column(
                            children: [
                              Text(style: TextStyle(fontSize: 18, fontFamily: 'Gothic A1',letterSpacing: -0.5, fontWeight: FontWeight.w600 ),'안녕하세요 시온쉼터 소장 오은숙 입니다.\n\n사람과 동물이 함께 행복한 세상을 꿈꾸는 시온쉼터는 개농장의 개들, 방치, 학대, 유기등 고통스런 삶을 살다 구조된 개 길 고양이 급식소의 고양이들을 케어 입양보내 행복한 삶을 찾아 주기 위해 오늘도 소명을 감당하고 있으며 시민의 자발적인 후원과 봉사로 운영됩니다.')
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
      )
    );
  }

}





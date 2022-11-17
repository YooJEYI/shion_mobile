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
                              Text(style: TextStyle(fontSize: 15),'안녕하세요 시온쉼터 소장 오은숙 입니다.\n\n2013년 전도사로 20년을 사역하다 건강상의 이유로 본가에 내려와 쉬고 있던중 집에서 키우던 찬양이 사료를 사러 동물 약품 가게에 갔다가 송아지 약을 사러 왔던 노회한 개 농장주를 만나면서 저는 동물들과의 인연이 시작되는 길로 들어서게 되었습니다. 2달을 매일 퇴근 후 개 농장으로 달려갔습니다. 때는 꽃피는 춘삼월인 4월 만개한 꽃들이 흐드러지는 화사한 계절에 썩은 시뻘건 김치밥을 먹으며 뜬장에 갇혀 인간의 식탁에 오를 고기가 되기위해 사육되던 22마리의 순연한 생명체와 마주하게 됩니다. 그들의 눈망울을 보았습니다. 체념한 듯 살아가던 도사 벤틀리, 아우디 4개월령의 만세, 요셉, 사라, 한나, 드보라 뱃속에 새생명을 품고 있었던 미소 이미 6 아이 출산한 예삐 동네 할아버지가 키우던 개가 새끼를8 마리를 낳자 이리저리 보내고 하필이면 개농장에 50 일된 꼬물이를 줬고 그아이가 시온이(백설) 등등 지난한 실랑이 끝에 개농장의 이 아이들 22 마리를 구조했습니다. 그리고 저의 삶은 사람의 영혼과 삶 영원을 하나님의 길로 인도하는 교역자에서 사설 유기동물 보호소장으로 바뀌었습니다. 시온쉼터 많은 이들이 도와주며 여기까지 왔습니다. 앞으로 갈길이 멀지만 또 기도하며 인고의 세월을 견디며 가겠습니다. 한 아이 한아이의 필요와 그들의 삶을 살피며 가겠습니다. 아이들이 많다고 한아이 한아이가 소흘히 대해지기 원치 않습니다. 하나님의 뜻이 있어 이세상에 동물의 몸으로 온 생명체 저에게 맡겨 주셨으니 청지기의 사명을 잘 감당하겠습니다.')
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





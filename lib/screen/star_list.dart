

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StarList extends StatefulWidget {
  const StarList({super.key});

  @override
  State<StarList> createState() => StarListState();
}

List<String> starListImage = [
  "assets/images/hj.jpg",
  "assets/images/nam.jpg",
  "assets/images/kimmiso.jpg",
  "assets/images/lee.jpg",
  "assets/images/wonho.jpg",
  "assets/images/jinwha.jpg",
  "assets/images/pilsoon.jpg",
  "assets/images/hyobum.jpg",
  "assets/images/lina.jpg",
  "assets/images/goean.jpg",
  "assets/images/yeonbok.jpg",
  "assets/images/hanboream.jpg",
  "assets/images/song2.jpg",
  "assets/images/doyoon.jpg",
  "assets/images/doong.jpg",
];

List<String> starListName = [
  "전혜진",
  "남형도",
  "김미소",
  "이웅종",
  "김원효",
  "심진화",
  "장필순",
  "신효범",
  "채리나",
  "고은성",
  "이연복",
  "한보름",
  "한송이",
  "윤도운",
  "동글개봉사단",
];


List<String> starListJob = [
  "미스코리아,배우",
  "머니투데이 기자",
  "아나운서",
  "원조 견통령, 대학교수",
  "개그맨",
  "개그우먼",
  "가수",
  "가수",
  "가수",
  "뮤지컬배우",
  "쉐프",
  "배우",
  "대전KGC인삼공사 배구선수",
  "데이식스 드러머",
  "이웅종 단장 봉사팀",
];

List<String> instagramUrl = [
  "https://www.instagram.com/hyejin_jun/",
  "https://www.instagram.com/love_ddolggom/",
  "https://www.instagram.com/ms__4343/",
  "https://www.instagram.com/ungjongi/",
  "https://www.instagram.com/wonhyo0925/",
  "https://www.instagram.com/shimjinhwa/",
  "https://www.instagram.com/jejusoony/",
  "https://www.instagram.com/hyobumshin/",
  "https://www.instagram.com/rina_sister/",
  "https://www.instagram.com/musical.ko/",
  "https://www.instagram.com/fuxtom/",
  "https://www.instagram.com/han_bling_/",
  "https://www.instagram.com/ssongr12/",
  "https://www.instagram.com/d.ddablue/",
];

class StarListState extends State<StarList>{

  @override
  Widget build(BuildContext context) {
    final tel = Uri.parse('tel:01039396036');
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
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
      body: Container(
        color: Colors.grey.shade200,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: ListView.builder(
            itemCount: starListImage.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () async {
                  launchUrl(Uri.parse(instagramUrl[index]));
                },
                child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  border: Border.all(color: Colors.white)
                ),
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Image(image: AssetImage(starListImage[index])),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            Text(starListName[index], style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),),
                            Text(starListJob[index],style: const TextStyle(fontSize: 16, color: Color(0xff00bd56)),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ));
            }
          ),
        ),
      ),
    );
  }
}




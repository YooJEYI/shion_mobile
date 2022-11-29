

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StarList extends StatefulWidget {
  const StarList({super.key});

  @override
  State<StarList> createState() => StarListState();
}

List<String> starListImage = [
  "assets/images/dog.jpg",
  "assets/images/dog1.jpg",
  "assets/images/sojang.jpg",
];

List<String> starListName = [
  "aaa",
  "vvs",
  "wqeqwewqeqw",
];


List<String> starListJob = [
  "111",
  "22222222",
  "33333",
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: ListView.builder(
            itemCount: starListImage.length,
            itemBuilder: (BuildContext context, int index) {
              return  Container(
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
                      Image(image: AssetImage(starListImage[index]),width: double.infinity),
                      Text(starListImage[index], style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),),
                      Text(starListJob[index],style: const TextStyle(fontSize: 16, color: Color(0xff00bd56)),)
                    ],
                  ),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}


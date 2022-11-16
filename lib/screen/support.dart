
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => SupportScreenState();
}

class SupportScreenState extends State<SupportScreen>{

  late TextEditingController _idController;
  late TextEditingController _seekToController;

  @override
  void dispose() {
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tel = Uri.parse('tel:01039396036');
    return SingleChildScrollView(child: Column(
      children: [
       Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 18, right: 18, top: 50, bottom: 15),
              child: Text("사설 유기견 보호소 시온쉼터를 도와주세요", style: TextStyle(color: Colors.green,fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              child:  GestureDetector(
                onTap: () async {
                  launchUrl(Uri.parse("https://www.ihappynanum.com/Nanum/B/B0CV58BN1L"));
                },
                child: Container(
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   image: AssetImage("assets/images/dog.jpg")
                    // ),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    // color: Colors.lightBlueAccent,
                    border: Border.all(
                      color: Colors.green,
                      width: 3
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Column(
                    children: [
                      Icon(LineAwesomeIcons.gratipay__gittip_, size: 55, color: Colors.green),
                      Text("후원하기",style: TextStyle(fontSize: 16),),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const ExpansionTile(
          title: Text(
            "시온쉼터는 어떤곳인가요?",
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold
            ),
          ),
          children: <Widget>[
            ListTile(
              title: Text(
                "1. 시온쉼터는 사설 유기견 보호소 입니다.",
              ),
            ),
            ListTile(
              title: Text(
                "2. 소장 한명이서 250마리를 돌보고 있습니다.",
              ),
            ),
            ListTile(
              title: Text(
                "3. 한달에 사료비만 800만원이 나가고 있습니다.",
              ),
            ),
          ],
        ),
        const ExpansionTile(
          title: Text(
            "시온쉼터를 어떻게 도울 수 있을까요?",
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold
            ),
          ),
          children: <Widget>[
            ListTile(
              title: Text(
                "1. 직접 와주셔서 봉사해주시면 감사드립니다.",
              ),
            ),
            ListTile(
              title: Text(
                "2. 아이들의 사료 및 병원비를 위해 모금 후원 부탁 드립니다.",
              ),
            ),
          ],
        ),
        const ExpansionTile(
          title: Text(
            "봉사를 하러 가면 어떤 일을 하나요?",
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold
            ),
          ),
          children: <Widget>[
            ListTile(
              title: Text(
                "1. 아이들의 사료를 나눠주는 사료봉사를 합니다.",
              ),
            ),
            ListTile(
              title: Text(
                "2. 아이들의 배설물을 포대자루에 치웁니다.",
              ),
            ),
            ListTile(
              title: Text(
                "3. 아이들의 생활터전을 청소합니다.",
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Volunteer extends StatefulWidget {
  const Volunteer({super.key});

  @override
  State<Volunteer> createState() => _VolunteerState();
}

class _VolunteerState extends State<Volunteer> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container( //scroll로 바꿔야 할듯 폰마다 크기 달라져서 깨짐
            color: Color(0xfff8f9fa),
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
                  color: Colors.white,
                  child:  GestureDetector(
                    onTap: () async {
                      launchUrl(Uri.parse("https://xn--4s4bxgm4g1wp.com/"));
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Icon(LineAwesomeIcons.home, size: 55, color: Colors.green),
                          Text("시온쉼터 홈페이지",style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 60, horizontal: 62),
                  color: Colors.white,
                  child:  GestureDetector(
                    onTap: () async {
                      launchUrl(Uri.parse("https://docs.google.com/forms/d/e/1FAIpQLSdxtkrRJFQXNyCXTYYRRsHoBci1G_2UID2LVCYFFakgIEEejA/viewform"));
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Icon(LineAwesomeIcons.dog, size: 55, color: Colors.green),
                          Text("입양하기",style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 60, horizontal: 22),
                  color: Colors.white,
                  child:  GestureDetector(
                    onTap: () async {
                      launchUrl(Uri.parse("https://band.us/band/63942980/post/11853"));
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Icon(LineAwesomeIcons.neos, size: 55, color: Colors.green),
                          Text("시온쉼터 네이버밴드",style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 60, horizontal: 22),
                  color: Colors.white,
                  child:  GestureDetector(
                    onTap: () async {
                      launchUrl(Uri.parse("https://www.instagram.com/zion_shelter/"));
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Icon(LineAwesomeIcons.instagram, size: 55, color: Colors.green),
                          Text("시온쉼터 인스타그램",style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 60, horizontal: 62),
                  color: Colors.white,
                  child:  GestureDetector(
                    onTap: () async {
                      launchUrl(Uri.parse("https://pf.kakao.com/_pDYlu"));
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Icon(LineAwesomeIcons.handshake, size: 55, color: Colors.green),
                          Text("대전 천사",style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 60, horizontal: 55),
                  color: Colors.white,
                  child:  GestureDetector(
                    onTap: () async {
                      launchUrl(Uri.parse("https://www.instagram.com/daengground/?igshid=YmMyMTA2M2Y%3D&__coig_restricted=1"));
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Icon(LineAwesomeIcons.store, size: 55, color: Colors.green),
                          Text("댕그라운드",style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

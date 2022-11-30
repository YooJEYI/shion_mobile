

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  
  @override
  State<Splash> createState() => _SplashState();
  
}

class _SplashState extends State<Splash>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.only(left: 100,right: 100,top: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/images/dog4.jpg',
              width: 200,
            ),
            Text(
              'loading...',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
  
  @override
  void initState() {
    super.initState();
    
    Future.delayed(Duration(seconds: 3)).then((value) => {
      Navigator.pushReplacementNamed(context, '/home')
    });
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:zion_shel/screen/introduce.dart';
import 'package:zion_shel/screen/notice_screen.dart';
import 'package:zion_shel/screen/support.dart';
import 'package:zion_shel/screen/video_list.dart';
import 'home.dart';
import '../screen/volunteer.dart';
import 'package:mailto/mailto.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.blueAccent,
    ),
  );
  runApp(YoutubePlayerDemoApp());
}

/// Creates [YoutubePlayerDemoApp] widget.
class YoutubePlayerDemoApp extends StatelessWidget {
  YoutubePlayerDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '시온쉼터',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          color: Colors.blueAccent,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.blueAccent,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

/// Homepage
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;

  final tabs = [
    const Volunteer(),
    const HomeScreen(),
    const SupportScreen(),
    const NoticeScreen(),
  ];

  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  final List<String> _ids = [
    '0Rya0igl1Rk',
    '-IPv8JMjnFQ',
    "7RJTVivCtj8",
    "f3sxEZTXGJQ",
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tel = Uri.parse('tel:01039396036');
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
      resizeToAvoidBottomInset: false,
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
      body: tabs[_currentIndex],
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
             UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/dog1.jpg'),
              ),
              accountEmail:Container(
                margin: const EdgeInsets.only(left: 45),
                child: TextButton(
                onPressed: () async {
                  const url = 'mailto:01039582627a@gmail.com';
                  if (await launchUrl(Uri.parse(url))) {
                    await canLaunchUrl(Uri.parse(url));
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Text('01039582627a@gmail.com', style: TextStyle(color: Colors.white),)
              )),
              accountName: Text('시온쉼터'),
              decoration: BoxDecoration(
                  color: Color(0xff00bd55),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
            ),
            ListTile(
              title: const Text('인사말'),
              onTap: () async {
                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Introduce())
                );
              },
            ),
            ListTile(
              title: const Text('시온쉼터 영상모음'),
              onTap: () async {
                await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VideoList())
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Colors.black,
      items: [
        BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.home),
            label: '홈',
            backgroundColor: Colors.black
        ),
        BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.dog),
            label: '시온소식',
            backgroundColor: Colors.black
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.volunteer_activism),
            label: '후원하기',
            backgroundColor: Colors.black
        ),
        BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.newspaper),
            label: '공지사항',
            backgroundColor: Colors.black
        ),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      currentIndex: _currentIndex,
    ),
    );
  }


}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:zion_shel/screen/support.dart';
import 'home.dart';
import '../screen/volunteer.dart';


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
    HomeScreen(),
    Volunteer(),
    SupportScreen(),
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
        autoPlay: true,
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
        backgroundColor: Color(0xfff8f9fa),
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
          leading: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: IconButton(onPressed: () async { await launchUrl(tel); }, icon: const Icon(Icons.phone))
          ),
          title: const Text(
            '시온쉼터',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
          // IconButton(
          //   icon: const Icon(Icons.video_library),
          //   onPressed: () => Navigator.push(
          //     context,
          //     CupertinoPageRoute(
          //       builder: (context) => //후원 페이지
          //     ),
          //   ),
          // ),
          ],
        ),
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Icon(LineAwesomeIcons.home),
              label: '홈',
              backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.volunteer_activism),
              label: '봉사문의'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '후원하기'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '공지사항'
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
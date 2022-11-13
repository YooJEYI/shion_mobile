import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:zion_shel/main_page.dart';

import 'test.dart';
import 'video_list.dart';

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

  Widget _screens(int index) {

    if(index == 0){
      return MyHomePage();
    } else if(index == 1){
      return const Test();
    } else {
      return MyHomePage();
    }
    // MySellPostPage(),
  
  }

  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  final List<String> _ids = [
    'RWI35ADBR_o',
    'EKBhs9p1WeU',
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
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              log('Settings Tapped!');
            },
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {
          _controller
              .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
          _showSnackBar('다음');
        },
      ),
      builder: (context, player) => Scaffold(
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
          // actions: [
            // IconButton(
            //   icon: const Icon(Icons.video_library),
            //   onPressed: () => Navigator.push(
            //     context,
            //     CupertinoPageRoute(
            //       builder: (context) => VideoList(),
            //     ),
            //   ),
            // ),
          // ],
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: ListView(
            children: [
              player,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _space,
                    _text('제목', _videoMetaData.title),
                    _space,
                    _text('채널', _videoMetaData.author),
                    _space,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.skip_previous),
                          onPressed: _isPlayerReady
                              ? () => _controller.load(_ids[
                          (_ids.indexOf(_controller.metadata.videoId) -
                              1) %
                              _ids.length])
                              : null,
                        ),
                        IconButton(
                          icon: Icon(
                            _controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                          ),
                          onPressed: _isPlayerReady
                              ? () {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                            setState(() {});
                          }
                              : null,
                        ),
                        IconButton(
                          icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
                          onPressed: _isPlayerReady
                              ? () {
                            _muted
                                ? _controller.unMute()
                                : _controller.mute();
                            setState(() {
                              _muted = !_muted;
                            });
                          }
                              : null,
                        ),
                        FullScreenButton(
                          controller: _controller,
                          color: Colors.blueAccent,
                        ),
                        IconButton(
                          icon: const Icon(Icons.skip_next),
                          onPressed: _isPlayerReady
                              ? () => _controller.load(_ids[
                          (_ids.indexOf(_controller.metadata.videoId) +
                              1) %
                              _ids.length])
                              : null,
                        ),
                      ],
                    ),
                    _space,
                    Row(
                      children: <Widget>[
                        const Text(
                          "볼륨",
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        Expanded(
                          child: Slider(
                            inactiveColor: Colors.white24,
                            value: _volume,
                            min: 0.0,
                            max: 100.0,
                            divisions: 10,
                            label: '${(_volume).round()}',
                            onChanged: _isPlayerReady
                                ? (value) {
                              setState(() {
                                _volume = value;
                              });
                              _controller.setVolume(_volume.round());
                            }
                            : null,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: GNav(
          backgroundColor: Colors.black,
          activeColor: Colors.white,
          gap: 8,
          tabBackgroundColor: Colors.grey.shade800,
          padding: EdgeInsets.all(16),
          onTabChange: (index) {
            _screens(index);
          },
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.person,
              text: 'Home',
            ),
            GButton(
              icon: Icons.history_edu,
              text: 'Home',
            ),
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
          ]
        ),
      ),
    );
  }

  Widget _text(String title, String value) {
    return RichText(
      text: TextSpan(
        text: '$title : ',
        style: const TextStyle(
          color: Color(0xff4a4a4a),
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Color(0xff4a4a4a),
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStateColor(PlayerState state) {
    switch (state) {
      case PlayerState.unknown:
        return Colors.grey[700]!;
      case PlayerState.unStarted:
        return Colors.pink;
      case PlayerState.ended:
        return Colors.red;
      case PlayerState.playing:
        return Colors.blueAccent;
      case PlayerState.paused:
        return Colors.orange;
      case PlayerState.buffering:
        return Colors.yellow;
      case PlayerState.cued:
        return Colors.blue[900]!;
      default:
        return Colors.blue;
    }
  }

  Widget get _space => const SizedBox(height: 10);

  Widget _loadCueButton(String action) {
    return Expanded(
      child: MaterialButton(
        color: Colors.blueAccent,
        onPressed: _isPlayerReady
            ? () {
          if (_idController.text.isNotEmpty) {
            var id = YoutubePlayer.convertUrlToId(
              _idController.text,
            ) ??
                '';
            if (action == 'LOAD') _controller.load(id);
            if (action == 'CUE') _controller.cue(id);
            FocusScope.of(context).requestFocus(FocusNode());
          } else {
            _showSnackBar('Source can\'t be empty!');
          }
        }
            : null,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Text(
            action,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}
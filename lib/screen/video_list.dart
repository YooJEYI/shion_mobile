import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Creates list of video players
class VideoList extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  final List<YoutubePlayerController> _controllers = [
    'xvm-LGlneBE',
    'pWycWUs5-7o',
    'ZtW7vvhScyI',
    'RAjnRpJVUaE',
    'i3mvqUdQE7Q',
    'mU24GOP1AJI',
    'pF0CKwmg2Po',
    'WzW5DVZBpZk',
    'pIu4aMiJ-dM',
    'spj9GeI636o',
    'TIfW83QpUl4',
    'HgG0bTb3FoI',
    '8-e9EfnzsfQ',
    '0J8Av3eX_eY',
  ]
      .map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    ),
  )
      .toList();

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
        title: const Text(
        '시온쉼터',
        style: TextStyle(color: Colors.white),
        ),
        actions: [
        IconButton(onPressed: () async { await launchUrl(tel); }, icon: const Icon(Icons.phone))
      ],
    ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return YoutubePlayer(
            key: ObjectKey(_controllers[index]),
            controller: _controllers[index],
            actionsPadding: const EdgeInsets.only(left: 16.0),
            bottomActions: [
              CurrentPosition(),
              const SizedBox(width: 10.0),
              ProgressBar(isExpanded: true),
              const SizedBox(width: 10.0),
              RemainingDuration(),
              FullScreenButton(),
            ],
          );
        },
        itemCount: _controllers.length,
        separatorBuilder: (context, _) => const SizedBox(height: 10.0),
      ),
    );
  }
}
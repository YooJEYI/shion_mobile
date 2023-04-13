
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NoticeScreen extends StatelessWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://시온쉼터.com/suda',
          javascriptMode: JavascriptMode.unrestricted,
          gestureNavigationEnabled: true,

        )
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../shared/cubit/cubit.dart';

class WebviewScreen extends StatelessWidget {
  final String link;
  const WebviewScreen({required this.link, super.key});

  @override
  Widget build(BuildContext context) {
    final WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(link));
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News App',
        ),
        titleSpacing: 15,
        actions: [
          IconButton(
            onPressed: () {
              AppCubit.get(context).changeMode();
            },
            icon: const Icon(Icons.dark_mode_outlined),
          ),
        ],
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}

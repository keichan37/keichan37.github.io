import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
//import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


import '../constants/web_view/url_error_code.dart';

String customCss = """
  header,
  .header {
    display: none;
  }

""";

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key);
  InAppWebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      //child: WebViewWidget(
        //controller: WebViewController()
          //..setJavaScriptMode(JavaScriptMode.unrestricted)
          //..setNavigationDelegate(
            //NavigationDelegate(
              //onPageStarted: (String url) async {
              //},
              //onPageFinished: (String url) {
              //},
              //onWebResourceError: (WebResourceError error) {
                //if (error.errorCode == UrlErrorCode.nsURLErrorCancelled) {
                  //return;
                //}
              //},
            //),
          //)
          //..loadRequest(Uri.parse("https://part.shufu-job.jp/tokyo")),
      //),
      child: Column(
        children:[
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri("https://part.shufu-job.jp/tokyo"),
              ),
              onWebViewCreated: (controller) {
                _controller = controller;
              },
              onLoadStop: (controller, url) async {
                // ページが遷移したときにもCSSを流し込む
                await controller.evaluateJavascript(source: """
                  var style = document.createElement('style');
                  style.innerHTML = `$customCss`;
                  document.head.appendChild(style);
                """);
              },
              onLoadStart: (controller, url) async {
                // 新しいページがロードされる前にもCSSを流し込む
                await controller.evaluateJavascript(source: """
                  var style = document.createElement('style');
                  style.innerHTML = `$customCss`;
                  document.head.appendChild(style);
                """);
              },
            ),
          ),
          TextButton(
            onPressed: () => _onBackPressed(context),
            child: Text(
              '戻る',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
        ],
      ),
    );
  }
    Future<void> _onBackPressed(BuildContext context) async {
    if (_controller != null && await _controller!.canGoBack()) {
      await _controller!.goBack(); // WebViewの履歴があれば戻る
    } else {
      Navigator.pop(context); // 履歴がなければアプリの画面を戻す
    }
  }
  Future<void> onPressAppBarBack(BuildContext context) async {
    await goBack();
  }

  Future<void> onPressBottomMenuBack() async {
    await goBack();
  }

  Future<void> goBack() async {
  }

  Future<void> goForward() async {
  }

  Future<void> reload() async {
  }
}

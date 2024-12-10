
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebView extends StatefulWidget {
  static const String routeName = 'WebView';
   WebView({super.key});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {


  @override
  Widget build(BuildContext context){
    Webviewlink webViewUrl = ModalRoute.of(context)?.settings.arguments as Webviewlink;
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (int progress) {
          Center(child: CircularProgressIndicator(),);
        },
        onWebResourceError: (error){
          Text(error.toString());
        },
        onHttpError: (HttpResponseError error) {
          Text(error.toString());
        },
      ))
      ..loadRequest(Uri.parse(webViewUrl.url.toString()));
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Web view"),
        ),
        body: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
class Webviewlink{
  String? url;
  Webviewlink({required this.url});
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

import '../../homepage/provider/searchprovider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Browser_Provider? providertrue;
  Browser_Provider? providerfalse;

  TextEditingController txtsearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    providertrue = Provider.of<Browser_Provider>(context, listen: true);
    providerfalse = Provider.of<Browser_Provider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    providertrue!.inAppWebViewController!.goBack();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    providertrue!.inAppWebViewController!.goForward();
                  },
                  child: Icon(Icons.arrow_forward),
                ),
                SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: Container(
                    height: 45,
                    child: TextField(
                      controller: txtsearch,
                      textInputAction: TextInputAction.next,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: " Search",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    providerfalse!.ChangeSearch(txtsearch.text);
                    providerfalse!.inAppWebViewController!.loadUrl(
                      urlRequest: URLRequest(
                        url: Uri.parse(
                            "https://www.google.com/search?q=${txtsearch.text}"),
                      ),
                    );
                  },
                  child: Icon(Icons.search),
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black38,
            ),
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse("https://www.google.com/"),
                ),
                onWebViewCreated: (controller) {
                  providerfalse!.inAppWebViewController = controller;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

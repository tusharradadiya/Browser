import 'package:browser/url/view/urlpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homepage/provider/searchprovider.dart';
import 'navigator/view/navigatorpage.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
      create: (context) => Browser_Provider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => Bottom(),
          'show':(context) => show_Page(),
        },
      ),
    )
  );
}
import 'package:app_links/app_links.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zarity2/provider/blogProvider.dart';
import 'package:zarity2/screens/blogDetailScreen.dart';
import 'package:zarity2/screens/blogListScreen.dart';

import 'deep_link_listener.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BlogProvider(),
      child: MaterialApp(
        routes: {
        '/blogDetail': (context) => BlogDetailScreen(blogId: '61mPBIxCmMDtvCvQqN8R')
        },
        title: 'Blog App',
        theme: ThemeData(
          scaffoldBackgroundColor:  Color(0xFFF8F8F8), // Set default scaffold background color to white
        ),
        home: DeepLinkListener(
            child:  BlogListScreen(),
      ),
    )
    );
  }
}

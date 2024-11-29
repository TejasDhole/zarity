import 'dart:developer';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:zarity2/screens/blogDetailScreen.dart';
import 'package:zarity2/screens/blogListScreen.dart';

class DeepLinkListener extends StatefulWidget {
  const DeepLinkListener({super.key, required this.child});
  final Widget child;

  @override
  State<DeepLinkListener> createState() => _DeepLinkListenerState();
}

class _DeepLinkListenerState extends State<DeepLinkListener> {
  @override
  void initState() {
    super.initState();

    final appLinks = AppLinks(); // AppLinks is a singleton

    // Subscribe to all events (initial link and further)
    final sub = appLinks.uriLinkStream.listen((uri) {
      log('Received URI: ${uri.toString()}');
      if (uri.host == 'flutter-deep-link' || uri.host == 'www.flutter-deep-link.com' && uri.pathSegments.isNotEmpty) {
        // Check if path segment is 'blogDetail' and handle navigation
        if (uri.pathSegments.first == 'blogDetail' && uri.pathSegments.length > 1) {
          final id = uri.pathSegments[1]; // Extract the ID from the URI
          log('Extracted Blog ID: $id');

          // Navigate to BlogDetailScreen with the extracted ID
          if (id.isNotEmpty && mounted) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BlogDetailScreen(blogId: id),
              ),
            );
          }
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

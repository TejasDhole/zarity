import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/BlogPostModel.dart';

class BlogProvider with ChangeNotifier {
  List<BlogPost> blogPosts = [];

  List<BlogPost> get getBlogPosts => blogPosts;

  Future<void> fetchBlogPosts() async {
    final firestore = FirebaseFirestore.instance;

    try {
      final snapshot = await firestore.collection('blogPosts').get();
      blogPosts = snapshot.docs
          .map((doc) => BlogPost.fromMap(doc.data() as Map<String, dynamic>, doc.id))
          .toList();
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}

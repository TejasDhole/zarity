import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/BlogPostModel.dart';

class BlogDetailScreen extends StatelessWidget {
  final String blogId;

  BlogDetailScreen({required this.blogId});

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Details'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: firestore.collection('blogPosts').doc(blogId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final data = snapshot.data?.data() as Map<String, dynamic>?;
          if (data == null) {
            return Center(child: Text('Blog not found.'));
          }

          final blogPost = BlogPost.fromMap(data, blogId);

          return SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(blogPost.imageURL, fit: BoxFit.cover),
                SizedBox(height: 16),
                Text(blogPost.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(blogPost.content, style: TextStyle(fontSize: 16)),
              ],
            ),
          );
        },
      ),
    );
  }
}

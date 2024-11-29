import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/blogProvider.dart';
import '../widget/blogCardWidget.dart';
import 'blogDetailScreen.dart';

class BlogListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blogs'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: BlogSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<BlogProvider>(context, listen: false).fetchBlogPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          return Consumer<BlogProvider>(
            builder: (context, blogProvider, child) {
              final blogs = blogProvider.getBlogPosts;

              return ListView.builder(
                itemCount: blogs.length,
                itemBuilder: (context, index) {
                  final blog = blogs[index];
                  print(blog.id);
                  return BlogCard(
                    imageUrl: blog.imageURL,
                    title: blog.title,
                    summary: blog.summary,
                    onReadMore: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlogDetailScreen(blogId: blog.id),
                        ),
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class BlogSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer<BlogProvider>(
      builder: (context, blogProvider, child) {
        final results = blogProvider.getBlogPosts.where((blog) {
          return blog.title.toLowerCase().contains(query.toLowerCase());
        }).toList();

        return ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            final blog = results[index];
            return BlogCard(
              imageUrl: blog.imageURL,
              title: blog.title,
              summary: blog.summary,
              onReadMore: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlogDetailScreen(blogId: blog.id),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
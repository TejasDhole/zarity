import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  final String imageUrl, title, summary;
  final VoidCallback onReadMore;

  BlogCard({
    required this.imageUrl,
    required this.title,
    required this.summary,
    required this.onReadMore,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // Set the border radius for curves
      ),
      color: Colors.white, // Set the background color of the card to white
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)), // Clip the image to match the card's border radius
            child: Image.network(imageUrl, fit: BoxFit.cover, height: 200, width: double.infinity),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(summary, maxLines: 2, overflow: TextOverflow.ellipsis),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: onReadMore,
                    child: Text('Read More', style: TextStyle(color: Colors.blueGrey)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
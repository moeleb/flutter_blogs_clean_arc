import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/core/utils/calculate_time.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/format_date.dart';
import '../../domain/entities/blog.dart';

class BlogViewer extends StatelessWidget {
  static route(Blog blog) => MaterialPageRoute(
      builder: (context) => BlogViewer(
            blog: blog,
          ));
  final Blog blog;

  const BlogViewer({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  blog.title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(height: 20),
                Text(
                  'By ${blog.posterName}',
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                const SizedBox(height: 20),
                Text(
                  "${formatDateBydMMMYYYY(blog.updatedAt)} . ${calculateReadingTime(blog.content)} min",
                  style: const TextStyle(
                    color: AppPallete.greyColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(blog.imageUrl),
                ),
                const SizedBox(height: 20),
                Text(
                  blog.content,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 2
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

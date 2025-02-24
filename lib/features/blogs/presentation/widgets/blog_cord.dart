import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/core/utils/calculate_time.dart';
import 'package:blog_app/features/blogs/presentation/pages/blog_viewer.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/blog.dart';

class BlogCord extends StatelessWidget {
  final Blog blog;
  final Color color;

  const BlogCord({super.key, required this.blog, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.push(context, BlogViewer.route(blog));
      },
      child: Container(
          decoration: BoxDecoration(
            color: color,
          ),
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(12),
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: blog.topics
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Chip(
                                label: Text(e),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Text(
                    blog.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],

              ),

               const SizedBox(height: 50,),
               Text('${calculateReadingTime(blog.content)} min')
            ],
          )),
    );
  }
}

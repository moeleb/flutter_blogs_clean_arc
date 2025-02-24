import 'dart:io';
import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/features/blogs/data/datasources/blog_remote_data_source.dart';
import 'package:uuid/uuid.dart';

import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/features/blogs/data/model/blog_model.dart';
import 'package:blog_app/features/blogs/domain/entities/blog.dart';
import 'package:blog_app/features/blogs/domain/repositories/blog_repository.dart';
import 'package:fpdart/fpdart.dart';

class BlogRepositoryImpl implements BlogRepository {
  final BlogRemoteDataSource dataSource;

  BlogRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, Blog>> uploadBlog({
    required File image,
    required String title,
    required String content,
    required String posterId,
    required List<String> topics,
  }) async {
    try {
      BlogModel blogModel = BlogModel(
        id: const Uuid().v1(),
        posterId: posterId,
        title: title,
        content: content,
        imageUrl: 'imageUrl',
        topics: topics,
        updatedAt: DateTime.now(),
      );

      final imageUrl = await dataSource.uploadBlogImage(
        image: image,
        blog: blogModel,
      );

      blogModel = blogModel.copyWith(imageUrl: imageUrl);

      final uploadedBlog = await dataSource.uploadBlog(blogModel);

      return right(uploadedBlog);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Blog>>> getAllBlogs() async {
    try {
      final blogs = await dataSource.getAllBlogs();
      return right(blogs);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}

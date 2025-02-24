import 'package:blog_app/features/blogs/domain/entities/blog.dart';
import 'package:flutter/material.dart';

@immutable
sealed class BlogState {}

final class BlogInitial extends BlogState {}

final class BlogLoading extends BlogState {}

final class BlogFailure extends BlogInitial {
  final String error;

  BlogFailure(this.error);
}

final class BlogSuccess extends BlogInitial {}

final class BlogDisplaySuccess extends BlogInitial {
  final List<Blog> blogs;

  BlogDisplaySuccess(this.blogs);

}

import 'dart:async';

import 'package:blog_app/core/usecases/usecase.dart';
import 'package:blog_app/features/blogs/domain/usecase/get_all_blogs.dart';
import 'package:blog_app/features/blogs/domain/usecase/upload_blog.dart';
import 'package:blog_app/features/blogs/presentation/bloc/blog_event.dart';
import 'package:blog_app/features/blogs/presentation/bloc/blog_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final UploadBlog uploadBlog;
  final GetAllBlogs getAllBlogs;

  BlogBloc({
    required this.uploadBlog,
    required this.getAllBlogs,
  }) : super(BlogInitial()) {
    on<BlogEvent>((event, emit) => emit(BlogLoading()));

    on<BlogUpload>(_onBlogUpload);

    on<BlogFetchAllBlogs>(_fetchAllBlogs);
  }

  FutureOr<void> _onBlogUpload(
      BlogUpload event, Emitter<BlogState> emit) async {
    final res = await uploadBlog(
      UploadBlogParams(
        posterId: event.posterId,
        title: event.title,
        content: event.content,
        image: event.image,
        topics: event.topics,
      ),
    );
    res.fold(
      (l) => emit(BlogFailure(l.message)),
      (r) => emit(BlogSuccess()),
    );
  }

  FutureOr<void> _fetchAllBlogs(
      BlogFetchAllBlogs event, Emitter<BlogState> emit) async {
    final res = await getAllBlogs(NoParams());
    res.fold(
      (l) => emit(BlogFailure(l.message)),
      (r) => emit(
        BlogDisplaySuccess(r),
      ),
    );
  }
}

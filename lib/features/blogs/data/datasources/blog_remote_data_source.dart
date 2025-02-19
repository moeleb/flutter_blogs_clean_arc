import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/features/blogs/data/model/blog_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class BlogRemoteDataSource {
  Future<BlogModel> uploadBlog(BlogModel blog);
}

class BlogRemoteDataSourceImpl implements BlogRemoteDataSource {
  final SupabaseClient supabaseClient;

  BlogRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<BlogModel> uploadBlog(BlogModel blog) async {
    try {
      supabaseClient.from("blogs").insert();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

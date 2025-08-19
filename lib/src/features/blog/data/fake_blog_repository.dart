// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_blog/src/constants/test_blogs.dart';
import 'package:flutter_blog/src/features/blog/domain/blog.dart';
import 'package:flutter_blog/src/features/blog/presentation/widgets/category_section.dart';
import 'package:flutter_blog/src/utils/delay.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeBlogRepository {
  final bool addDelay;
  FakeBlogRepository({this.addDelay = true});
  final _blogs = kTestBlogs;

  Future<List<Blog>> getBlogs() async {
    await delay(addDelay);
    return _blogs;
  }
}

final blogRepository = Provider((ref) {
  return FakeBlogRepository();
});

final blogsListProvider = FutureProvider((ref) {
  final FakeBlogRepository fakeBlogRepository = ref.watch(blogRepository);
  return fakeBlogRepository.getBlogs();
});

final blogsCategoryProvider = Provider((ref) {
  final blogsList = ref.read(blogsListProvider).asData?.value ?? [];
  return blogsList.map((blog) => blog.category).toSet().toList();
});

final blogProvider = Provider.autoDispose.family<Blog, int>((ref, id) {
  final blogsList = ref.read(blogsListProvider).asData!.value;
  return blogsList.firstWhere((blog) => blog.id == id);
});

final filteredBlogsProvider = Provider<List<Blog>>((ref) {
  final selectedCategory = ref.watch(categoryController);
  final blogsList = ref.read(blogsListProvider).asData!.value;
  return selectedCategory == null
      ? blogsList
      : blogsList.where((b) => b.category == selectedCategory).toList();
});

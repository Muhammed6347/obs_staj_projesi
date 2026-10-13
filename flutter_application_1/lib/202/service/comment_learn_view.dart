import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/service/comment_model.dart';
import 'package:flutter_application_1/202/service/post_service.dart';

class CommentLearnView extends StatefulWidget {
  const CommentLearnView({super.key, this.postId});
  final int? postId;

  @override
  State<CommentLearnView> createState() => _CommentLearnViewState();
}

class _CommentLearnViewState extends State<CommentLearnView> {
  late final IPostService postService;
  bool _isloading = false;
  List<CommentModel>? _commentItem;

  @override
  void initState() {
    super.initState();
    postService = PostService();
    fetchItemWithId(widget.postId ?? 0);
  }

  void _changeLoading() {
    setState(() {
      _isloading = !_isloading;
    });
  }

  Future<void> fetchItemWithId(int postId) async {
    _changeLoading();
    _commentItem = await postService.fetchRelatedCommentWithPostId(postId);
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _commentItem?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return
          Card(
            child:Text(_commentItem?[index].email ?? '')
          );
        },
      ),
    );
  }
}

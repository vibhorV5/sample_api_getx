import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_api/screens/posts/controller/posts_controller.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    final PostsController postsController = Get.put(PostsController());

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.deleteAll();
            Get.back();
          },
        ),
        title: Text(
          'Posts loaded using GETX',
        ),
      ),
      backgroundColor: Colors.red,
      body: SingleChildScrollView(child: Obx(
        () {
          return Column(
            children: [
              postsController.postList.isEmpty
                  ? Container(
                      height: 750,
                      width: 600,
                      color: Colors.red,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
                    )
                  : Container(
                      height: 750,
                      width: 600,
                      color: Colors.red,
                      child: ListView.builder(
                          itemCount: postsController.postList.length,
                          itemBuilder: (context, index) {
                            return Text(postsController.postList[index].body
                                .toString());
                          }),
                    )
            ],
          );
        },
      )),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_flutter_project/pages/full_screen_image.dart';
import '../controller/online_sync_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final onlineSync = Get.put(SyncController());
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //Check whether user scrolled to last position
        onlineSync.loadMore();
      }
    });
    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 0, 4, 4),
              child: GridView.builder(
                controller: _scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8),
                itemCount: onlineSync.isLoading.value
                    ? onlineSync.mainList.length + 6
                    : onlineSync.mainList.length,
                itemBuilder: (context, index) {
                  if (onlineSync.mainList.length <= index) {
                    return GridTile(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.blueGrey,
                        child: Container(
                          height: 150,
                          width: 150,
                          color: Colors.black,
                        ),
                      ),
                    ));
                  } else {
                    return InkWell(
                      onTap: () {
                        Get.to(() => FullScreenImage(), arguments: [
                          onlineSync.mainList[index].link.toString()
                        ]);
                      },
                      child: GridTile(
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Hero(
                          tag: onlineSync.mainList[index].link.toString(),
                          child: CachedNetworkImage(
                            imageUrl:
                                onlineSync.mainList[index].link.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                    );
                  }
                },
              ),
            ),
            if (onlineSync.isLoading.value) ...[
              const Positioned(
                  bottom: 4,
                  right: 0,
                  left: 0,
                  child: SizedBox(
                    height: 80,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ))
            ]
          ],
        );
      }),
    );
  }
}

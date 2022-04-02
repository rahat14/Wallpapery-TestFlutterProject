import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:test_flutter_project/utils.dart';

class FullScreenImage extends StatelessWidget {
  FullScreenImage({Key? key}) : super(key: key);
  var data = Get.arguments;
  var filePath = "";
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    print("" + data.toString());
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CachedNetworkImage(
              imageUrl: data[0],
              fit: BoxFit.cover,
              imageBuilder: (context, imageProvider) {
                DefaultCacheManager().getFileFromCache(data[0]).then((file) {
                  print("Path -> ${file?.file.path}");
                  if (file != null) {
                    filePath = file.file.path.toString();
                    imageFile = file.file;
                  }
                });
                return Image(
                  image: imageProvider,
                  fit: BoxFit.cover,
                );
              },
            )),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MaterialButton(
                onPressed: () async {
                  try {
                    await AsyncWallpaper.setWallpaperFromFile(
                        imageFile?.path.toString() ?? "",
                        AsyncWallpaper.HOME_SCREEN);
                  } catch (e) {
                    HelperClass.showToast("Error : ${e.toString()}",
                        isError: true);
                    print(e.toString());
                  } finally {
                    HelperClass.showToast("Wallpaper Set", isError: false);
                  }
                },
                textColor: Colors.white,
                color: Colors.transparent,
                child: const Text("Set This As  Wallpaper"),
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const DefaultTextStyle(
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  child: Text("Cancel"),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

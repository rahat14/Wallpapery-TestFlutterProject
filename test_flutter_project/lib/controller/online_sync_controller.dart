import 'dart:io';

import 'package:get/get.dart';
import 'package:test_flutter_project/main.dart';
import 'package:test_flutter_project/models/image_remote_response.dart';

import '../database/local_db.dart';
import '../services/local_services.dart';
import '../services/remote_services.dart';
import '../utils.dart';

class SyncController extends GetxController {
  var currentPage = 1;

  var lastPage = 0;
  var totalItems = 0;

  var mainList = List<LocalPhotoData>.empty(growable: true).obs;

  var downloadedProducts = List<Photos>.empty(growable: true);

  var isLoading = false.obs;
  AppDatabase database = LocalService().getDatabase();

  @override
  void onInit() {
    super.onInit();
    currentPage = 1;
    decideOfflineOrOnline();
  }

  void downloadProductsData(int page) async {
    if (!isLoading.value) {
      isLoading(true);
      var productsResp = await RemoteServices.fetchProducts(page.toString());
      if (productsResp != null) {
        var photos = productsResp.photos;
        currentPage = productsResp.page ?? 1;
        totalItems = productsResp.totalResults ?? mainList.length;
        if (photos != null) {
          downloadedProducts.addAll(photos);
          // downloadedProducts.assignAll(mainList)  ;
          convertFunction(downloadedProducts);
        }
      } else {
        print("this is NULL ");
      }
    }
  }

  void loadMore() {
    currentPage = currentPage + 1;
    decideOfflineOrOnline();
  }

  void addListOFProduct(List<LocalPhotoData> convertedList) async {
    try {
      await database.insertPhotos(convertedList);
      mainList.assignAll(convertedList);
      isLoading(false);
    } catch (error) {
      HelperClass.showToast("Error  ${error.toString()} products added");
    } finally {}
  }

  void convertFunction(List<Photos> products) {
    var convertedList = List<LocalPhotoData>.empty(growable: true);

    for (var item in products) {
      var convertedItem = HelperClass.ObjectTypeCoverter(item, currentPage);
      convertedList.add(convertedItem);
    }
    addListOFProduct(convertedList);
  }

  Future<void> decideOfflineOrOnline() async {
    var isOnline = await HelperClass().hasNetwork();
    if (isOnline) {
      database.deleteAllLocalPhoto();
      downloadProductsData(currentPage);
    } else {
      // app is in offline mode
      // will check if the list is empty
      if (mainList.isEmpty) {
        isLoading(false);
        var list = await database.getAllPhotos();
        mainList.assignAll(list);
        // need to change the current page
       if(mainList.isNotEmpty){
        var  size = mainList.length-1 ;
         var page  = mainList[size].pageNo ;
        currentPage = page ;
       }else {
         HelperClass.showToast("No Cached Data");
       }
      }
      else {
        HelperClass.showToast("No Internet Available,Showing Cached Data");
      }
    }
  }
}

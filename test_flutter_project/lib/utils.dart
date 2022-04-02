import 'dart:io';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:test_flutter_project/database/local_db.dart';
import 'package:test_flutter_project/models/image_remote_response.dart';
import 'package:uuid/uuid.dart';

class HelperClass {
  static ProgressDialog getProgressDiagloue(context) {
    ProgressDialog pd = ProgressDialog(context: context);
    return pd;
  }

  static String getTodayDate() {
    DateTime now = DateTime.now(); // 30/09/2021 15:54:30
    DateTime dateOnly = now.getDateOnly(); // 30/09/2021
    return now.getDateOnly().toString();
  }

  static showHideProgress(ProgressDialog pd, bool isShow) {
    if (isShow) {
      pd.show(
          max: 100,
          msg: "Syncing Data...",
          progressType: ProgressType.valuable);
    } else {
      pd.close();
    }
  }

  Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static showToast(String str, {isError = false}) {
    var color = Colors.green;
    if (isError) {
      color = Colors.red;
    }
    Fluttertoast.showToast(
        msg: str,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static ObjectTypeCoverter(Photos item, int currentPage) {
    var newItem = LocalPhotoData(
        id: item.id ?? 1,
        pageNo: currentPage,
        link: item.src?.portrait ?? "",
        linkSrc: item.src?.large ?? "");
    return newItem;
  }
}

extension MyDateExtension on DateTime {
  DateTime getDateOnly() {
    return DateTime(this.year, this.month, this.day);
  }
}

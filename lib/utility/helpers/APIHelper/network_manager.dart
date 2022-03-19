import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/alert_bar.dart';

class NetworkManager {
  static Future<bool> checkConnectivity(
      {BuildContext? context, bool showError = false}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile) {
      debugPrint("mobile Internet");
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      debugPrint("wifi Internet");
      return true;
    } else {
      debugPrint("No Internet");
      if (showError && context != null) {
        AlertBar.show(context,
            title: 'No Connectivity',
            description: 'Please Check Internet Connection',
            position: AlertBarPosition.TOP,
            backgroundColor: Colors.red);
      }
      return false;
    }
  }
}

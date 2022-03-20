import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../constants/constant.dart';

class AppVersion extends StatelessWidget {
  const AppVersion({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        width: 100,
        child: FutureBuilder<PackageInfo>(
          future: PackageInfo.fromPlatform(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                debugPrint("snapshot = $snapshot");
                return Text(
                  (snapshot.data != null)
                      ? "version ${snapshot.data!.version}"
                      : "version",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: Constants.kAppFonts.kFontWeightMedium,
                    fontFamily: Constants.kAppFonts.kFontFamily,
                  ),
                );
              default:
                return Text("");
            }
          },
        ),
      ),
    );
  }
}

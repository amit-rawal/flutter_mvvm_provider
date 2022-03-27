import 'package:flutter/material.dart';
import 'package:shri_app/utility/constants/constant.dart';

import '../../utility/common_widgets/spacing_widget.dart';
import '../../utility/constants/colors.dart';
import '../../utility/constants/constant.dart';
import '../../utility/navigator/navigator.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({Key? key, required this.pageTitle}) : super(key: key);
  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(this.pageTitle)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //_getHeader(context),
              Expanded(
                child: Center(
                  child: Text(
                    "Coming soon...",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textColorPrimary,
                      fontWeight: Constants.kAppFonts.kFontWeightMedium,
                      fontFamily: Constants.kAppFonts.kFontFamily,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _getHeader(BuildContext context) {
    return Container(
      //height: 200,
      //color: Colors.red,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => AppNavigator.instance.popRoute(),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 24,
                ),
                addHorizontalSpace(12),
                Text(
                  pageTitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textColorPrimary,
                    fontWeight: Constants.kAppFonts.kFontWeightMedium,
                    fontFamily: Constants.kAppFonts.kFontFamily,
                  ),
                ),
              ],
            ),
          ),
          addVerticalSpace(8),
          Row(
            children: [
              Text(
                this.pageTitle,
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.textColorPrimary,
                  fontWeight: Constants.kAppFonts.kFontWeightBold,
                  fontFamily: Constants.kAppFonts.kFontFamily,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

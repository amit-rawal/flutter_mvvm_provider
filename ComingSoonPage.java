import 'package:flutter/material.dart';
import 'package:illumine/generated/l10n.dart';
import 'package:illumine/src/core/value/Constants.dart';
import 'package:illumine/src/core/value/colors.dart';
import 'package:illumine/utility/navigator.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({Key? key, required this.pageTitle}) : super(key: key);

  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _getHeader(context),
              Expanded(
                child: Center(
                  child: Text(S.of(context).commonNothingToShow),
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
            onTap: () => IllumineNavigator.instance.popRoute(),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 24,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  S.of(context).textHome,
                  style: TextStyle(
                    fontSize: 14,
                    color: IllumineColors.appBlackColor,
                    fontWeight: Constants.kAppFonts.kFontWeightMedium,
                    fontFamily: Constants.kAppFonts.kFontFamily,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              // SvgPicture.asset(
              //   Assets.ballot_black,
              //   fit: BoxFit.fill,
              //   height: 22,
              //   width: 22,
              // ),
              // SizedBox(
              //   width: 12,
              // ),
              Text(
                this.pageTitle, //"Join New Program",
                style: TextStyle(
                  fontSize: 20,
                  color: IllumineColors.appBlackColor,
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

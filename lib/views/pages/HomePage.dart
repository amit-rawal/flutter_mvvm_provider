import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: Text("Hello"),
      ),

      // ChangeNotifierProvider<HomeViewModel>.value(
      //   value: HomeViewModel().fetchPosts(),
      //   child: Consumer<HomeViewModel>(
      //     builder: (_, viewModel, __) {
      //       return ValueListenableBuilder<BaseResponseModel>(
      //           valueListenable: viewModel.viewModelNotifier,
      //           builder: (_, value, __) {
      //             return RefreshIndicator(
      //               onRefresh: () => viewModel.fetchPosts(),
      //               child: SingleChildScrollView(
      //                 padding: const EdgeInsets.only(top: 16.0),
      //                 child: Builder(builder: (_) {
      //                   if (value.loadingStatus == ApiStatus.loading) {
      //                     return const Padding(
      //                       padding: EdgeInsets.symmetric(vertical: 64.0),
      //                       child: Center(child: CircularProgressIndicator()),
      //                     );
      //                   }
      //                   if (value.loadingStatus == ApiStatus.failed) {
      //                     //Todo(@ajinkyakaranjikar): Decision point - What to show when api fails with no message?
      //                     return Padding(
      //                       padding: const EdgeInsets.symmetric(vertical: 64.0),
      //                       child: Center(
      //                           child: Text(value.message ??
      //                               S.of(context).commonNothingToShow)),
      //                     );
      //                   }
      //                   if (value.loadingStatus == ApiStatus.completed) {
      //                     if (value._postList.isNotEmpty) {
      //                       return ListView.builder(
      //                           shrinkWrap: true,
      //                           physics:
      //                           const NeverScrollableScrollPhysics(),
      //                           itemCount:
      //                           section.activities.length,
      //                           itemBuilder: (context, index) {
      //                             return _getCell(
      //                                 context, section, index);
      //                           }),;
      //                     } else {
      //                       return Padding(
      //                         padding: EdgeInsets.symmetric(vertical: 64.0),
      //                         child: Center(
      //                             child: Text(
      //                                 S.of(context).commonNoActivityToShow)),
      //                       );
      //                     }
      //                   }
      //                   return Padding(
      //                     padding: EdgeInsets.symmetric(vertical: 64.0),
      //                     child: Text("Something went wrong."),
      //                   );
      //                 }),
      //               ),
      //             );
      //           });
      //     },
      //   ),
      // ),
    );
  }
}

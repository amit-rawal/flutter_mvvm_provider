import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/base_view_model.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final T Function(BuildContext) vmBuilder;
  final Widget Function(BuildContext, T) builder;

  const BaseView({Key? key, required this.vmBuilder, required this.builder})
      : super(key: key);

  @override
  _BaseViewState createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: widget.vmBuilder(context),
      child: Consumer<T>(
        builder: _buildScreenContent,
      ),
    );
  }

  // Widget _buildScreenContent(
  //         BuildContext context, T viewModel, Widget? child) =>
  //     !viewModel.isInitialized
  //         ? Container(
  //             color: Colors.white,
  //             child: Center(child: CircularProgressIndicator()))
  //         : Stack(
  //             children: [
  //               widget.builder(context, viewModel),
  //               Visibility(
  //                 visible: viewModel.isLoading,
  //                 child: Center(
  //                   child: Center(child: CircularProgressIndicator()),
  //                 ),
  //               )
  //             ],
  //           );

  Widget _buildScreenContent(BuildContext context, T viewModel, Widget? child) {
    return widget.builder(context, viewModel);

    // !viewModel.isInitialized
    //  ? Container(
    //      color: Colors.white,
    //      child: Center(child: CircularProgressIndicator()))
    //  : Stack(
    //      children: [
    //        widget.builder(context, viewModel),
    //        Visibility(
    //          visible: viewModel.isLoading,
    //          child: Center(
    //            child: Center(child: CircularProgressIndicator()),
    //          ),
    //        )
    //      ],
    //    );
  }
}

//Alternative way
// class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<T>.value(
//       value: widget.vmBuilder(context),
//       builder: _buildScreenContent,
//     );
//   }
//
//   Widget _buildScreenContent(BuildContext context, Widget child) => !Provider.of<T>(context).isInitialized
//       ? Container(color: Colors.white, child: Center(child: CircularProgressIndicator()))
//       : Stack(
//           children: [
//             widget.builder(context, Provider.of<T>(context)),
//             Visibility(
//               visible: Provider.of<T>(context).isLoading,
//               child: Center(
//                 child: Center(child: CircularProgressIndicator()),
//               ),
//             )
//           ],
//         );
// }

import 'package:flutter/material.dart';

import '../../../base/views/base_view.dart';
import '../../../view_models/dash_view_model.dart';

class DashboardPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return BaseView<DashboardViewModel>(
      vmBuilder: (context) => DashboardViewModel(),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, DashboardViewModel viewModel) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Home")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RefreshIndicator(
          onRefresh: () => viewModel.refreshData(),
          backgroundColor: Colors.teal,
          color: Colors.white,
          displacement: 200,
          strokeWidth: 5,
          child: viewModel.errorMessage != null
              ? Center(
                  child: Expanded(child: Text("${viewModel.errorMessage}")))
              : _getBody(viewModel),
        ),
      ),
    );
  }

  Widget _getBody(DashboardViewModel viewModel) {
    if (viewModel.users.isNotEmpty) {
      return ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: viewModel.users.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("Name : ${viewModel.users[index].name}"),
              subtitle: Text("City : ${viewModel.users[index].city}"),
            );
          });
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 64.0),
        child: Center(child: Text("Nothing to show")),
      );
    }
  }
}

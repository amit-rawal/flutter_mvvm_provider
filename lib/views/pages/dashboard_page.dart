import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/views/pages/side_menu_page.dart';

import '../../base/views/base_view.dart';
import '../../view_models/dash_view_model.dart';

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
      drawer: AppDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: RefreshIndicator(
                  onRefresh: () => viewModel.refreshData(),
                  backgroundColor: Colors.teal,
                  color: Colors.white,
                  displacement: 100,
                  strokeWidth: 2,
                  child: _getBody(viewModel),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getBody(DashboardViewModel viewModel) {
    if (viewModel.isInitialized == false || viewModel.isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (viewModel.errorMessage != null) {
      return Center(child: Text("${viewModel.errorMessage}"));
    }
    if (viewModel.users.isNotEmpty) {
      return ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          //physics: NeverScrollableScrollPhysics(),
          itemCount: viewModel.users.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("Name : ${viewModel.users[index].name}"),
              subtitle: Text("City : ${viewModel.users[index].city}"),
            );
          });
    } else {
      return Center(child: Text("Nothing to show"));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/view_models/dash_view_model.dart';
import 'package:flutter_mvvm_provider/views/pages/dashboard/dashboard_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DashboardViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter + MVVM + Provider',
        home: DashboardPage(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/ui/views/HomePage.dart';
import 'package:provider/provider.dart';

import 'business_logics/view_models/home_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter + MVVM + Provider',
      home: HomePage(),
    );
  }
}

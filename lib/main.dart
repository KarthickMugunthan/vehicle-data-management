import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'item_provider.dart';
import 'item_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemProvider(),
      child: MaterialApp(
        title: 'Vehicle Monitoring',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ItemListScreen(),
      ),
    );
  }
}
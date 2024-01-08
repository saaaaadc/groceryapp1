import 'package:flutter/material.dart';
import 'package:groceryapp1/bottomnavigationbar.dart';

class customScaffold extends StatelessWidget {
  final Widget body;
  final bool showBottomnavbar;
  final int initialIndex;
  customScaffold({super.key, required this.body,
    this.showBottomnavbar = false,
    this.initialIndex=0,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
    );
  }
}

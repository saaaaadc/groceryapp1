import 'package:flutter/material.dart';
import 'package:groceryapp1/accounts.dart';
import 'package:groceryapp1/homepage.dart';
import 'package:groceryapp1/mycart.dart';
import 'package:groceryapp1/order.dart';
import 'package:groceryapp1/products.dart';
import 'package:groceryapp1/profile.dart';
import 'package:groceryapp1/wallet.dart';

class bottomnavbar extends StatefulWidget {
  const bottomnavbar({super.key});

  @override
  State<bottomnavbar> createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  int currentTabIndex=0;
  late List<Widget>pages;
  late Widget currentPage;
  late home homepage;
  late wallet wallets;
  late Ordercart order;
  late Profile profile;
  @override
  void initState() {
    homepage=home();
    wallets=wallet();
    order=Ordercart();
    profile=Profile();
    pages=[homepage,order,wallets,profile];
    super.initState();
  }
  Widget build(BuildContext context) {
    return Container();
  }
}

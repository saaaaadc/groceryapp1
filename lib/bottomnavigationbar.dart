import 'package:flutter/material.dart';
import 'package:groceryapp1/accounts.dart';
import 'package:groceryapp1/homepage.dart';
import 'package:groceryapp1/mycart.dart';
import 'package:groceryapp1/products.dart';

class bottom extends StatefulWidget {
  final int initialIndex;
  const bottom({super.key, required this.initialIndex});

  @override
  State<bottom> createState() => _bottomState();
}

class _bottomState extends State<bottom> {
  var _selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedIndex=widget.initialIndex;
  }


  void _onitemTapped(int index){
    setState(() {
      _selectedIndex =index;

    });
    switch(index){
      case 0: void_navigateToRoute(context, '/home', home());
      case 1: void_navigateToRoute(context, '/products', products());
      case 2: void_navigateToRoute(context, '/myaccount', accounts());
      case 3: void_navigateToRoute(context, '/mycart', mycart());
    }

  }
  void_navigateToRoute(context,String routeName, Widget screen){
    final String? currentRouteName = ModalRoute.of(context)?.settings.name;
    bool routeExists =currentRouteName==routeName;

    if(routeExists){
      Navigator.popUntil(context,ModalRoute.withName (routeName));

    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder:
          (context)=>screen,
          settings: RouteSettings
            (name:routeName)));
    }
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(currentIndex:_selectedIndex ,
        type: BottomNavigationBarType.fixed,
        onTap: _onitemTapped,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon:
          Icon(Icons.home_outlined,
              color: _selectedIndex == 0 ? Colors.green:Colors.black
          ),
            label: "HOME",
          ),BottomNavigationBarItem(icon:
          Icon(Icons.production_quantity_limits_outlined,
              color:_selectedIndex == 0 ? Colors.green:Colors.black
          ),
            label: "PRODUCTS",
          ),
          BottomNavigationBarItem(icon:
          Icon(Icons.person_2_outlined,
              color: _selectedIndex == 0 ? Colors.green:Colors.black
          ),
            label: "MY ACCOUNT",
          ),BottomNavigationBarItem(icon:
          Icon(Icons.shopping_cart_rounded,
              color: _selectedIndex == 0 ? Colors.green:Colors.black
          ),
            label: "MYCART",
          )



        ]);
  }
}
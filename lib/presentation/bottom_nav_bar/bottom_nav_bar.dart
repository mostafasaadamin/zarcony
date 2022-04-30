import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:zarcony/domain/cart_view_model.dart';
import 'package:zarcony/presentation/cart/cart_screen.dart';
import 'package:zarcony/presentation/favourite_screen.dart';
import 'package:zarcony/presentation/home/home.dart';
class BottomNavigationBarScreen extends StatefulWidget {
  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBarScreen> {
  late PersistentTabController _controller;
  final cartProvider = ChangeNotifierProvider((ref) => CartViewModel());

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      const Favourites(),
      CartScreen(cartProvider),
      const Favourites(),
      CartScreen(cartProvider),

    ];
  }
  @override
  void initState() {
  _controller = PersistentTabController(initialIndex: 0);
   super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          hideNavigationBarWhenKeyboardShows: true,
          margin: const EdgeInsets.all(0.0),
          popActionScreens: PopActionScreensType.all,
          bottomScreenMargin: 0.0,
          selectedTabScreenContext: (context) {
            // testContext = context;
          },
          // hideNavigationBar: _hideNavBar,
          decoration: NavBarDecoration(
              colorBehindNavBar: Colors.indigo,
              borderRadius: BorderRadius.circular(20.0)),
          popAllScreensOnTapOfSelectedTab: true,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style15,
        ),
        Positioned.fill(
          bottom: 20.h,
          left: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Consumer(
    builder: (context, ref, _) {
      final cartData=ref.watch(cartProvider);
      print("Iscakked${cartData.total}");
      return FloatingActionButton(
        backgroundColor: Color(0xffD93E11),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text("\$ ${cartData.total}",style: TextStyle(fontSize: 12),),
            const Icon(CupertinoIcons.cart_badge_plus),
          ],
        ), onPressed: () {},
      );
    }
            ),
          ),)

      ],
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Grocery"),
        activeColorPrimary: Color(0xffE27D5F),
        inactiveColorPrimary:Color(0xffCED1D2),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.bell),
        title: ("news"),
        activeColorPrimary: Color(0xffE27D5F),
        inactiveColorPrimary:Color(0xffCED1D2),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.cart),
        title: ("Cart"),
        activeColorPrimary: Color(0xffE27D5F),
        inactiveColorPrimary:Color(0xffCED1D2),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.suit_heart),
        title: ("favourite"),
        activeColorPrimary: Color(0xffE27D5F),
        inactiveColorPrimary:Color(0xffCED1D2),
      ),

      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings_solid),
        title: ("Cart"),
        activeColorPrimary: Color(0xffE27D5F),
        inactiveColorPrimary:Color(0xffCED1D2),
      ),
    ];
  }
}

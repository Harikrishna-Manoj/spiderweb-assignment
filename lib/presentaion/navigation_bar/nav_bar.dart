import 'package:flutter/material.dart';
import 'package:spiderweb_assignment/core/constant_colors.dart';
import 'package:spiderweb_assignment/presentaion/page_cart/screen_cart.dart';
import 'package:spiderweb_assignment/presentaion/page_productlist/screen_product.dart';

// ignore: must_be_immutable
class NavBar extends StatelessWidget {
  NavBar({super.key});
  List<Widget> screens = [const ScreenHome(), const ScreenCart()];
  ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 203, 232, 255),
      body: ValueListenableBuilder<int>(
          valueListenable: pageIndexNotifier,
          builder: (context, index, child) {
            return screens[index];
          }),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: ValueListenableBuilder(
            valueListenable: pageIndexNotifier,
            builder: (context, value, _) {
              return BottomNavigationBar(
                type: BottomNavigationBarType.shifting,
                elevation: 50,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home_outlined,
                        size: 30,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.backpack_outlined,
                        size: 30,
                      ),
                      label: '')
                ],
                currentIndex: pageIndexNotifier.value,
                selectedItemColor: buttonBlueColor,
                unselectedItemColor: Colors.grey,
                onTap: (index) {
                  pageIndexNotifier.value = index;
                },
              );
            }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:spiderweb_assignment/core/constant_colors.dart';
import 'package:spiderweb_assignment/presentaion/page_product_details/widget.dart';

class ScreenPageDetails extends StatelessWidget {
  const ScreenPageDetails({super.key, this.index});
  final int? index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: StackedImgeAndTileWidget(index: index ?? 0)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: buttonBlueColor,
          icon: const Icon(
            Icons.backpack,
            color: Colors.white,
          ),
          label: const Text(
            "Add to cart",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          )),
    );
  }
}

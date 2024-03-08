import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spiderweb_assignment/application/cart_bloc/cart_bloc.dart';
import 'package:spiderweb_assignment/application/deatil_bloc/detail_bloc.dart';
import 'package:spiderweb_assignment/core/constant_colors.dart';
import 'package:spiderweb_assignment/presentaion/page_product_details/widget.dart';

class ScreenPageDetails extends StatelessWidget {
  const ScreenPageDetails({super.key, this.index, required this.productId});
  final int? index;
  final String productId;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DetailBloc>(context)
          .add(CheckProductInCartEvent(shoeName: productId));
    });
    return Scaffold(
      body: SafeArea(child: StackedImgeAndTileWidget(index: index ?? 0)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          return FloatingActionButton.extended(
              onPressed: () {
                state is ProductAddedState
                    ? context
                        .read<CartBloc>()
                        .add(DeleteProductEvent(id: productId))
                    : context
                        .read<DetailBloc>()
                        .add(ProdctDataToCartEvent(index: index!));
                BlocProvider.of<DetailBloc>(context)
                    .add(CheckProductInCartEvent(shoeName: productId));
              },
              backgroundColor: buttonBlueColor,
              icon: const Icon(
                Icons.backpack,
                color: Colors.white,
              ),
              label: Text(
                state is ProductAddedState ? "Added to cart" : "Add to cart",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ));
        },
      ),
    );
  }
}

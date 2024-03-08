import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spiderweb_assignment/application/cart_bloc/cart_bloc.dart';
import 'package:spiderweb_assignment/application/deatil_bloc/detail_bloc.dart';
import 'package:spiderweb_assignment/core/constant.dart';
import 'package:spiderweb_assignment/core/constant_colors.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
    required this.index,
    required this.productId,
  });
  final int index;
  final String productId;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_circle_left,
              color: buttonBlueColor,
              size: 40,
            )),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: BlocBuilder<DetailBloc, DetailState>(
            builder: (context, state) {
              return CircleAvatar(
                  radius: 16.5,
                  backgroundColor: state is ProductAddedState
                      ? buttonBlueColor
                      : Colors.white,
                  child: IconButton(
                      onPressed: () {
                        state is ProductAddedState
                            ? context
                                .read<CartBloc>()
                                .add(DeleteProductEvent(id: productId))
                            : context
                                .read<DetailBloc>()
                                .add(ProdctDataToCartEvent(index: index));
                        BlocProvider.of<DetailBloc>(context)
                            .add(CheckProductInCartEvent(shoeName: productId));
                      },
                      icon: Icon(
                        Icons.backpack,
                        color: state is ProductAddedState
                            ? Colors.white
                            : buttonBlueColor,
                        size: 16.5,
                      )));
            },
          ),
        )
      ],
    );
  }
}

class DetailWidget extends StatelessWidget {
  const DetailWidget({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "₹ ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.red),
                ),
                Text(
                  "${productData[index]["price"]}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ],
            ),
            Text("Size ${productData[index]["size"]}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Description",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              productData[index]["description"],
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}

class OfferWidget extends StatelessWidget {
  const OfferWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Best price"),
        Text(
          "10% off",
          style: TextStyle(color: Colors.redAccent),
        ),
      ],
    );
  }
}

class TitlePriceWidget extends StatelessWidget {
  const TitlePriceWidget({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productData[index]["brandName"],
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        ),
        Text(
          productData[index]["shoeName"],
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 40, color: Colors.red),
        ),
      ],
    );
  }
}

class StackedImgeAndTileWidget extends StatelessWidget {
  const StackedImgeAndTileWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: h,
      width: w,
      child: Stack(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Flexible(
                      child: Container(
                    height: h * 0.17,
                    color: commonScreenBlueColor,
                  )),
                  Container(
                    width: w,
                    height: h * 0.3,
                    color: commonScreenBlueColor,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Hero(
                          tag: "shoe$index",
                          child: Image.asset(
                            productData[index]["image"],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(top: h * 0.1, right: 10, child: const OfferWidget()),
              Positioned(
                bottom: 0,
                child: Container(
                  width: w,
                  height: h * 0.5,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: w * 0.03,
                      right: w * 0.03,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        DetailWidget(
                          index: index,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ActionButtons(
                index: index,
                productId: productData[index]["shoeName"],
              )
            ],
          ),
          Positioned(
              left: 10,
              top: h * 0.1,
              child: TitlePriceWidget(
                index: index,
              )),
        ],
      ),
    );
  }
}

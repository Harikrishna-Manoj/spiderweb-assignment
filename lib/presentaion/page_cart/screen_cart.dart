import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spiderweb_assignment/application/cart_bloc/cart_bloc.dart';
import 'package:spiderweb_assignment/core/constant_colors.dart';
import 'package:spiderweb_assignment/presentaion/page_cart/widgets.dart';
import 'package:spiderweb_assignment/presentaion/page_productlist/widget.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CartBloc>(context).add(LoadProdctEvent());
    });
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: CustomPaint(
          painter: PageBlurEffect(isCircleLeft: true),
          child: CustomPaint(
            painter: PageBlurEffect(isCircleLeft: false),
            child: SizedBox(
              height: h,
              width: w,
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0, left: 10),
                    child: BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        return state is ProductLoadedState
                            ? state.cartModelDataList.isNotEmpty
                                ? Column(
                                    children: [
                                      const Row(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10),
                                            child: Text(
                                              'My Bag',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 40,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          height: h * 0.6,
                                          child: ListView.separated(
                                              itemBuilder: (context, index) {
                                                final item = state
                                                    .cartModelDataList[index];
                                                return SlideAction(
                                                    brandName: item.brandName!,
                                                    shoeName: item.shoeName!,
                                                    count: item.count!,
                                                    index: index.toString(),
                                                    id: item.productId!,
                                                    productSize: item.size!,
                                                    price: item.price!,
                                                    image: item.image!);
                                              },
                                              separatorBuilder:
                                                  (context, index) {
                                                return const SizedBox(
                                                  height: 15,
                                                );
                                              },
                                              itemCount: state
                                                  .cartModelDataList.length)),
                                      TotalAmountWidget(
                                        totalPrice: state.totlePrice.toString(),
                                        itemNumber:
                                            state.cartModelDataList.length,
                                      ),
                                      SizedBox(
                                        height: 20,
                                        width: w,
                                        child: Center(
                                          child: AnimatedTextKit(
                                            repeatForever: true,
                                            animatedTexts: [
                                              FadeAnimatedText(
                                                "Swipe left to delete item",
                                                textStyle: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Colors.red),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                : AnimatedTextKit(
                                    repeatForever: true,
                                    animatedTexts: [
                                      FadeAnimatedText("No items",
                                          textStyle: const TextStyle(
                                              fontSize: 40, color: Colors.cyan))
                                    ],
                                  )
                            : const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TotalAmountWidget extends StatelessWidget {
  const TotalAmountWidget({
    super.key,
    required this.itemNumber,
    required this.totalPrice,
  });
  final int itemNumber;
  final String totalPrice;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CartBloc>(context).add(LoadProdctEvent());
    });
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    return Container(
      width: w,
      height: h * 0.07,
      decoration: const BoxDecoration(
          color: commonScreenBlueColor,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(70, 158, 158, 158),
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0, left: 15),
        child: Row(
          children: [
            Text(
              "$itemNumber Items",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const Spacer(),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return Row(
                  children: [
                    const Text(
                      "₹ ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.red),
                    ),
                    Text(
                      totalPrice,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

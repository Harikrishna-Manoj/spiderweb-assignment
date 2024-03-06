import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:spiderweb_assignment/core/constant_colors.dart';
import 'package:spiderweb_assignment/presentaion/page_cart/widgets.dart';
import 'package:spiderweb_assignment/presentaion/page_productlist/widget.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> cartPageRebuildNotifer = ValueNotifier(true);

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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 10),
                            child: Text(
                              'My Bag',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.6,
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return SlideAction(
                                  cartPageRebuildNotifer:
                                      cartPageRebuildNotifer,
                                  index: index.toString(),
                                  id: "1",
                                  name: "Nike Jordan",
                                  productSize: "8",
                                  price: "345",
                                  image: "assets/images/shoes_1.png");
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 15,
                              );
                            },
                            itemCount: 3),
                      ),
                      const TotalAmountWidget(),
                      AnimatedTextKit(
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class TotalAmountWidget extends StatelessWidget {
  const TotalAmountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
      child: const Padding(
        padding: EdgeInsets.only(right: 15.0, left: 15),
        child: Row(
          children: [
            Text(
              "3 Items",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Spacer(),
            Row(
              children: [
                Text(
                  "₹ ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.red),
                ),
                Text(
                  "900",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

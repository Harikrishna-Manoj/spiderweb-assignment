import 'package:flutter/material.dart';
import 'package:spiderweb_assignment/core/constant.dart';
import 'package:spiderweb_assignment/core/constant_colors.dart';
import 'package:spiderweb_assignment/core/constant_fonts.dart';
import 'dart:math';

import 'dart:ui' show ImageFilter;

import 'package:spiderweb_assignment/presentaion/page_product_details/screen_product_detail.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return GridView.count(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        clipBehavior: Clip.none,
        crossAxisCount: 2,
        // mainAxisSpacing: 20,
        childAspectRatio: 0.8 / 1.2,
        children: List.generate(
            6,
            (index) => Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ScreenPageDetails(
                              index: index,
                            ),
                          ));
                        },
                        child: BlurContainer(
                          color: const Color.fromARGB(69, 255, 255, 255),
                          width: w * 0.6,
                          height: h * 0.31,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(children: [
                                SizedBox(
                                  width: w * 0.45,
                                  height: h * 0.17,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Hero(
                                      tag: "shoe$index",
                                      child: Image.asset(
                                        productData[index]["image"],
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                CircleAvatar(
                                    radius: 16.5,
                                    backgroundColor: buttonBlueColor,
                                    child: IconButton(
                                        tooltip: "Cart",
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.backpack,
                                          color: Colors.white,
                                          size: 16.5,
                                        ))),
                              ]),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 5),
                                child: Text(
                                  productData[index]["brandName"],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 5),
                                child: Text(
                                  "Size : ${productData[index]["size"]}",
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 5),
                                child: Text(
                                  'Rate : ₹${productData[index]["price"]}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )));
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shoe Store',
          style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              fontFamily: titleAntaFont),
        ),
        Text(
          "Choose your style",
          style: TextStyle(fontSize: 20, fontFamily: titleAntaFont),
        )
      ],
    );
  }
}

class PageBlurEffect extends CustomPainter {
  PageBlurEffect({super.repaint, required this.isCircleLeft});
  final bool isCircleLeft;

  @override
  void paint(Canvas canvas, Size size) {
    Paint path = Paint()
      ..color = const Color.fromARGB(255, 122, 205, 244)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, .1);
    Offset center = isCircleLeft
        ? Offset(0, size.height * 0.2)
        : Offset(size.width, size.height * 0.8);
    double radius = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radius, path);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BlurContainer extends StatelessWidget {
  final Widget child;

  final double? height;

  final double? width;

  final double elevation;

  final double blur;

  final EdgeInsetsGeometry padding;

  final Color color;

  final BorderRadius borderRadius;

  const BlurContainer({
    Key? key,
    required this.child,
    this.height,
    this.width,
    this.blur = 5,
    this.elevation = 0,
    this.padding = const EdgeInsets.all(8),
    this.color = Colors.transparent,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
  }) : super(key: key);

  /// Creates a blurry container whose [width] and [height] are equal.
  const BlurContainer.square({
    Key? key,
    required this.child,
    double? dimension,
    this.blur = 5,
    this.elevation = 0,
    this.padding = const EdgeInsets.all(8),
    this.color = Colors.transparent,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
  })  : width = dimension,
        height = dimension,
        super(key: key);

  /// Creates a blurry container whose [width] and [height] are equal.
  const BlurContainer.expand({
    Key? key,
    required this.child,
    this.blur = 5,
    this.elevation = 0,
    this.padding = const EdgeInsets.all(8),
    this.color = Colors.transparent,
    this.borderRadius = BorderRadius.zero,
  })  : width = double.infinity,
        height = double.infinity,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      color: color,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            height: height,
            width: width,
            padding: padding,
            decoration: BoxDecoration(
              border: Border.all(color: buttonBlueColor),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

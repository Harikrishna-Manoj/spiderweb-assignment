import 'package:flutter/material.dart';
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
            10,
            (index) => Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ScreenPageDetails(),
                          ));
                        },
                        child: BlurContainer(
                          width: w * 0.6,
                          height: h * 0.3,
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
                                      tag: Object(),
                                      child: Image.asset(
                                        "assets/images/shoes_1.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0, top: 5),
                                child: Text(
                                  "Nike",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 5),
                                child: Text(
                                  "Size : 7",
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 5),
                                child: Text(
                                  'Rate : ₹2000',
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
  /// The [child] will be shown over blurry container.
  final Widget child;

  /// [height] of blurry container.
  final double? height;

  /// [width] of blurry container.
  final double? width;

  /// [elevation] of blurry container.
  ///
  /// Defaults to `0`.
  final double elevation;

  /// The [blur] will control the amount of [sigmaX] and [sigmaY].
  ///
  /// Defaults to `5`.
  final double blur;

  /// [padding] adds the [EdgeInsetsGeometry] to given [child].
  ///
  /// Defaults to `const EdgeInsets.all(8)`.
  final EdgeInsetsGeometry padding;

  /// Background color of container.
  ///
  /// Defaults to `Colors.transparent`.
  ///
  /// The [color] you define will be shown at `0.5` opacity.
  final Color color;

  /// [borderRadius] of blurry container.
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
            // color: color,
            child: child,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spiderweb_assignment/core/constant_colors.dart';

class ScreenPageDetails extends StatelessWidget {
  const ScreenPageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        height: h,
        width: w,
        child: Stack(
          children: [
            Container(
              width: w,
              height: h * 0.55,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Hero(
                tag: Object(),
                child: Image.asset(
                  "assets/images/shoes_1.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: w,
                height: h * 0.5,
                decoration: BoxDecoration(
                    color: commonScreenBlueColor,
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: Column(
                  children: [Text("")],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

// class DetailCustomPainter extends CustomPainter {
//   final Size size;

//   DetailCustomPainter({super.repaint, required this.size});
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = commonScreenBlueColor
//       ..strokeWidth = .5
//       ..style = PaintingStyle.fill;
//     Path path = Path()..moveTo(0, size.height * 0.1);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }

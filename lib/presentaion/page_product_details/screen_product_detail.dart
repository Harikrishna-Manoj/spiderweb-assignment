import 'package:flutter/material.dart';
import 'package:spiderweb_assignment/core/constant.dart';
import 'package:spiderweb_assignment/core/constant_colors.dart';

class ScreenPageDetails extends StatelessWidget {
  const ScreenPageDetails({super.key, required this.index});
  final int index;
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
              height: h * 0.54,
              color: Colors.white,
              child: Hero(
                tag: "shoe$index",
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
                color: commonScreenBlueColor,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: w * 0.03,
                    right: w * 0.03,
                  ),
                  child: Column(
                    children: [
                      TitlePriceWidget(),
                      OfferWidget(),
                      SizedBox(
                        height: 30,
                      ),
                      DetailWidget()
                    ],
                  ),
                ),
              ),
            ),
            ActionButtons()
          ],
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.white,
          label: Text(
            "Add to cart",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )),
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_circle_left,
              color: backBlueColor,
              size: 40,
            )),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: CircleAvatar(
              radius: 16.5,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.trolley,
                    color: Colors.white,
                    size: 16.5,
                  ))),
        )
      ],
    );
  }
}

class DetailWidget extends StatelessWidget {
  const DetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Size 8",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 20,
        ),
        Text(
          "Details",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(
          shoesDescription,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}

class OfferWidget extends StatelessWidget {
  const OfferWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Nike",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        Text(
          " ₹2000",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ],
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

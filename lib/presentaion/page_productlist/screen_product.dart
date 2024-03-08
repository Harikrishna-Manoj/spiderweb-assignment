import 'package:flutter/material.dart';
import 'package:spiderweb_assignment/presentaion/page_productlist/widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: CustomPaint(
        painter: PageBlurEffect(isCircleLeft: true),
        child: CustomPaint(
          painter: PageBlurEffect(isCircleLeft: false),
          child: SizedBox(
            height: h,
            width: w,
            child: Padding(
                padding: EdgeInsets.only(
                    left: w * 0.03, right: w * 0.03, top: w * 0.1),
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.transparent,
                      expandedHeight: h * 0.1,
                      flexibleSpace: FlexibleSpaceBar(
                        background: ListView(
                          children: const [TitleWidget()],
                        ),
                      ),
                    ),
                    SliverList(
                        delegate: SliverChildListDelegate([
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: h * 0.08,
                          ),
                          const ProductGridView(),
                        ],
                      ),
                    ]))
                  ],
                )),
          ),
        ),
      ),
    ));
  }
}

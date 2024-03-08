import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spiderweb_assignment/application/cart_bloc/cart_bloc.dart';
import 'package:spiderweb_assignment/presentaion/page_productlist/widget.dart';

// ignore: must_be_immutable
class SlideAction extends StatelessWidget {
  const SlideAction({
    super.key,
    required this.brandName,
    required this.count,
    required this.shoeName,
    required this.productSize,
    required this.price,
    required this.image,
    required this.id,
    required this.index,
  });
  final String brandName;
  final String shoeName;
  final int count;

  final String productSize;
  final int price;
  final String image;
  final String id;
  final String index;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Dismissible(
      key: Key(index),
      background: const BlurContainer(
        color: Color.fromARGB(69, 255, 255, 255),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          bool dismiss = false;
          await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Are you sure?",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  actions: [
                    TextButton(
                        onPressed: () {
                          dismiss = false;
                          Navigator.pop(context);
                        },
                        child: const Text("No",
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    TextButton(
                        onPressed: () {
                          BlocProvider.of<CartBloc>(context)
                              .add(DeleteProductEvent(id: id));
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Yes",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        )),
                  ],
                );
              });
          return dismiss;
        }
        return null;
      },
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const ScreenPageDetails(),
          //     ));
        },
        child: BlurContainer(
            color: const Color.fromARGB(69, 255, 255, 255),
            width: size.width,
            height: size.height * 0.18,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 4, right: 15),
                  height: size.height * 0.17,
                  width: size.width * .26,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(13)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: Image.asset(
                      image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "$brandName $shoeName",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Row(
                              children: [
                                const Text(
                                  "₹ ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.red),
                                ),
                                Text(
                                  "$price",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              padding: const EdgeInsets.only(bottom: 15),
                              onPressed: () {
                                BlocProvider.of<CartBloc>(context).add(
                                    UpdateProductCount(
                                        count: count,
                                        id: id,
                                        isIncrement: false));
                              },
                              icon: const Icon(
                                Icons.minimize,
                              )),
                          Text(
                            count.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                BlocProvider.of<CartBloc>(context).add(
                                    UpdateProductCount(
                                        count: count,
                                        id: id,
                                        isIncrement: true));
                              },
                              icon: const Icon(Icons.add)),
                          const Text("||   "),
                          Text(
                            'Size $productSize',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

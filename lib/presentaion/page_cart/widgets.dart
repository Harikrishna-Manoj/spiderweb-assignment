import 'package:flutter/material.dart';
import 'package:spiderweb_assignment/presentaion/page_product_details/screen_product_detail.dart';
import 'package:spiderweb_assignment/presentaion/page_productlist/widget.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Container(
          width: size.width,
          height: size.height * 0.13,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 4, right: 15),
                height: size.height * 0.12,
                width: size.width * .23,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(13)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Roller Rabit',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Text('Roller Rabit'),
                  const Text(
                    '300',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          )),
    );
  }
}

// ignore: must_be_immutable
class SlideAction extends StatelessWidget {
  SlideAction(
      {super.key,
      required this.name,
      required this.productSize,
      required this.price,
      required this.image,
      required this.id,
      required this.index,
      this.cartPageRebuildNotifer});
  final String name;
  final String productSize;
  final String price;
  final String image;
  final String id;
  final String index;
  ValueNotifier<bool>? cartPageRebuildNotifer;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Dismissible(
      key: Key(index),
      background: BlurContainer(
        color: const Color.fromARGB(69, 255, 255, 255),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(
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
                        onPressed: () {},
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
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ScreenPageDetails(),
              ));
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
                              name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Row(
                              children: [
                                Text(
                                  "₹ ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.red),
                                ),
                                Text(
                                  price,
                                  style: TextStyle(
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
                              onPressed: () {},
                              icon: const Icon(
                                Icons.minimize,
                              )),
                          Text(
                            '2',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.add)),
                          Text("||   "),
                          Text(
                            'Size 8',
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

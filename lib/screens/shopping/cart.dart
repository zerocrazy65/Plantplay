import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/theme/style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:status_alert/status_alert.dart';
import '../../middleware/connect.dart';
import 'package:provider/provider.dart';

import '../../providers/cartProviders.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  bool isDelete = false;
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    List<ProductConstructor> cartStore = cartProvider.cartStore;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    int totalPrice = 0;

    int calTotal() {
      for (var item in cartStore) {
        totalPrice += item.price!;
      }
      return totalPrice;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isDelete = !isDelete;
              });
            },
            icon: const ColorFiltered(
                colorFilter: ColorFilter.mode(
                  ColorTheme.greyColor,
                  BlendMode.srcIn,
                ),
                child: Icon(Icons.delete)),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey.withOpacity(0.3),
                width: 1.3,
              ))),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "My Cart",
                      style: FontTheme.headerText,
                    ),
                    SizedBox(
                      width: screenWidth * 0.3,
                    ),
                    Text(
                      "Total ${cartStore.length} Items",
                      style: FontTheme.bodyText,
                    ),
                  ],
                ),
              ),
            ),
            if (cartStore.isEmpty)
              Column(children: [
                Column(
                  children: [
                    Image.asset('assets/img/cartEmpty.png'),
                    Text(
                      'Your cart is empty',
                      style: FontTheme.bodyText,
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Text(
                      'Looks like you have not added anything to cart.',
                      style: FontTheme.subBodyText,
                    ),
                    Text(
                      'Go ahead & explore products.',
                      style: FontTheme.subBodyText,
                    ),
                  ],
                )
              ])
            else
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (var item in cartStore)
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: ColorTheme.blurGreenColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.3,
                                    height: screenHeight * 0.15,
                                    child: Image.asset(
                                      item.img.toString(),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name.toString(),
                                        style: FontTheme.bodyText,
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        '\$${item.price.toString()}',
                                        style: FontTheme.detailText,
                                      ),
                                    ],
                                  ),
                                  if (isDelete)
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Transform.scale(
                                          scale: 1.3,
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                cartProvider
                                                    .removeItemFromCart(item);
                                              });
                                            },
                                            icon: Icon(
                                              Icons.delete_forever,
                                              color: Colors.red[400],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  const SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: FontTheme.bodyText,
                    ),
                    Text(
                      '\$${calTotal().toString()}',
                      style: FontTheme.bodyText,
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // print(cartStore);
                      CoolAlert.show(
                        context: context, 
                        type: CoolAlertType.success,
                        text: 'Payment successful!',
                        autoCloseDuration: const Duration(seconds: 2),
                        backgroundColor: Colors.white,
                        confirmBtnText: "",
                        confirmBtnColor: Colors.white
                      );
                      
                      // StatusAlert.show(
                      //   context,
                      //   duration: const Duration(seconds: 2),
                      //   title: "Payment successful!",
                      //   titleOptions: StatusAlertTextConfiguration(
                      //     style: GoogleFonts.quicksand(
                      //       fontSize: 24,
                      //       fontWeight: FontWeight.w500,
                      //       color: const Color(0xFF312E49)
                      //     )
                      //   ),
                      //   backgroundColor: Colors.white,
                      //   configuration:WidgetConfiguration(
                      //     widget: Column(
                      //       children: [
                      //         ClipRRect(
                      //           borderRadius: BorderRadius.circular(120),
                      //           child: Container(
                      //             color: Color(0xFF16C992),
                      //             child: const Padding(
                      //               padding: EdgeInsets.all(20),
                      //               child: Icon(
                      //                 Icons.done,
                      //                 color: Colors.white,
                      //                 size: 65,
                      //               ),
                      //             )
                      //           ),
                      //         ),
                      //         const SizedBox(
                      //           height: 30,
                      //         ),
                      //         Text(
                      //           "Payment successful!",
                      //           style: GoogleFonts.quicksand(
                      //             fontSize: 24,
                      //             fontWeight: FontWeight.w500,
                      //             color: const Color(0xFF312E49)
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   )
                      // );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          ColorTheme.mainGreenColor),
                    ),
                    child: Text(
                      'Buy now',
                      style: FontTheme.buttonText,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

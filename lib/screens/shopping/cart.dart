import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/theme/style.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<String> cartStore = [];
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
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
                      "Total x Items",
                      style: FontTheme.bodyText,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  if (cartStore.isEmpty)
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
                          'Looks like you have not added anything to card.',
                          style: FontTheme.subBodyText,
                        ),
                        Text(
                          'Go ahead & explore products.',
                          style: FontTheme.subBodyText,
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        for (var item in cartStore) Text(item),
                      ],
                    ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: FontTheme.bodyText,
                    ),
                    Text(
                      'xxx',
                      style: FontTheme.bodyText,
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: null,
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

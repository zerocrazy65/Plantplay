import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:status_alert/status_alert.dart';

import '../provider/cartProviders.dart';
import '../../theme/style.dart';
import '../middleware/connect.dart';

class CartHeader extends StatelessWidget {
  final int cartItemCount;

  const CartHeader({required this.cartItemCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.3),
            width: 1.3,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "My Cart",
              style: FontTheme.headerText,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.3),
            Text(
              "Total $cartItemCount Items",
              style: FontTheme.bodyText,
            ),
          ],
        ),
      ),
    );
  }
}

class EmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Image.asset('assets/img/cartEmpty.png'),
            Text(
              'Your cart is empty',
              style: FontTheme.bodyText,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
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
      ],
    );
  }
}

class CartItems extends StatelessWidget {
  final List<ProductConstructor> cartStore;
  final bool isDelete;

  const CartItems({required this.cartStore, required this.isDelete});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (var item in cartStore)
              Column(
                children: [
                  const SizedBox(height: 10),
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
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name.toString(),
                              style: FontTheme.bodyText,
                            ),
                            const SizedBox(height: 3),
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
                                    cartProvider.removeItemFromCart(item);
                                  },
                                  icon: Icon(
                                    Icons.delete_forever,
                                    color: Colors.red[400],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class TotalSection extends StatelessWidget {
  final List<ProductConstructor> cartStore;

  const TotalSection({required this.cartStore});
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final totalPrice = calTotal(cartStore);

    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: FontTheme.bodyText,
            ),
            Text(
              '\$${totalPrice.toString()}',
              style: FontTheme.bodyText,
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: cartStore.isEmpty
                ? null // Disable button if cartStore is empty
                : () async {
                    for (var item in cartStore) {
                      await recordSlip(currentEmail, item.id.toString());
                    }
                    cartProvider.clearCart();
                    StatusAlert.show(
                      context,
                      duration: const Duration(seconds: 2),
                      backgroundColor: Colors.white,
                      configuration: WidgetConfiguration(
                        widget: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(120),
                              child: Container(
                                color: const Color(0xFF16C992),
                                child: const Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 45,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Payment successful!",
                              style: GoogleFonts.quicksand(
                                fontSize: 21,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF312E49),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                ColorTheme.mainGreenColor,
              ),
            ),
            child: Text(
              cartStore.isEmpty ? 'Your cart is empty' : 'Buy now',
              style: FontTheme.buttonText,
            ),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  int calTotal(List<ProductConstructor> cartStore) {
    int totalPrice = 0;

    for (var item in cartStore) {
      totalPrice += item.price!;
    }
    return totalPrice;
  }
}

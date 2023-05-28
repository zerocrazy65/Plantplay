import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/theme/style.dart';
import 'package:provider/provider.dart';
import '../../providers/cartProviders.dart';
import '../../widgets/cartWidgets.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  bool isDelete = false;
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartStore = cartProvider.cartStore;

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
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                isDelete ? ColorTheme.highlightColor : ColorTheme.greyColor,
                BlendMode.srcIn,
              ),
              child: const Icon(Icons.delete),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CartHeader(cartItemCount: cartStore.length),
            if (cartStore.isEmpty)
              EmptyCart()
            else
              CartItems(cartStore: cartStore, isDelete: isDelete),
            TotalSection(cartStore: cartStore),
          ],
        ),
      ),
    );
  }
}

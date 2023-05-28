import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/cartProviders.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../middleware/connect.dart';
import '../theme/style.dart';

class ProductImageSection extends StatelessWidget {
  final ProductConstructor product;

  const ProductImageSection({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(12),
        bottomRight: Radius.circular(12),
      ),
      child: Container(
        color: ColorTheme.blurGreenColor,
        height: screenHeight * 0.455,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(left: 10, right: 20, top: 20),
            //   child: ProductHeader(product: product),
            // ),
            SizedBox(height: screenHeight * 0.005),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                '${product.type}',
                style: GoogleFonts.quicksand(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ColorTheme.purpleColor,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                '${product.name}',
                style: FontTheme.headerText.copyWith(fontSize: 30),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.35,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    bottom: 0,
                    right: -20,
                    child: Image.asset(
                      '${product.img}',
                      height: screenHeight * 0.35,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: ProductActions(product: product),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductHeader extends StatelessWidget {
  final ProductConstructor product;

  const ProductHeader({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 35,
            color: ColorTheme.purpleColor,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Container(
            color: ColorTheme.mainGreenColor,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 3,
                bottom: 3,
                left: 8,
                right: 8,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '${product.rating}',
                    style: GoogleFonts.quicksand(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProductActions extends StatelessWidget {
  final ProductConstructor product;

  const ProductActions({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PRICE   \$${product.price}',
              style: FontTheme.bodyText,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FavoriteButton(),
                const SizedBox(width: 20),
                ShoppingBagButton(product: product),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ],
    );
  }
}

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        width: 55,
        height: 55,
        color: Colors.white,
        child: TextButton(
          child: const Icon(
            Icons.favorite,
            size: 36,
            color: ColorTheme.mainGreenColor,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}

class ShoppingBagButton extends StatefulWidget {
  final ProductConstructor product;
  const ShoppingBagButton({Key? key, required this.product}) : super(key: key);
  @override
  _ShoppingBagButtonState createState() => _ShoppingBagButtonState();
}

class _ShoppingBagButtonState extends State<ShoppingBagButton> {
  bool shopIsActive = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        width: 55,
        height: 55,
        color: ColorTheme.mainGreenColor,
        child: TextButton(
          child: Icon(
            Icons.shopping_bag_outlined,
            size: 36,
            color: shopIsActive ? Colors.white54 : Colors.white,
          ),
          onPressed: () {
            final cartProvider =
                Provider.of<CartProvider>(context, listen: false);
            cartProvider.addToCart(widget.product);
            setState(() {
              shopIsActive = !shopIsActive;
            });
          },
        ),
      ),
    );
  }
}

class ProductMetrics extends StatelessWidget {
  final ProductConstructor product;

  const ProductMetrics({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MetricItem(
          icon: Icons.sunny,
          label: 'LIGHT',
          value: '${product.light}%',
        ),
        MetricItem(
          icon: Icons.thermostat,
          label: 'TEMPERATURE',
          value: '${product.temp}-${product.temp! + 20} \u2109',
        ),
        MetricItem(
          icon: Icons.water_drop,
          label: 'WATER',
          value: '${product.water}ml',
        ),
      ],
    );
  }
}

class MetricItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const MetricItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Icon(
          icon,
          size: screenHeight * 0.038,
          color: ColorTheme.highlightColor,
        ),
        SizedBox(height: screenHeight * 0.01),
        Text(
          label,
          style: FontTheme.bodyText.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        Text(
          value,
          style: FontTheme.bodyText.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: ColorTheme.highlightColor,
          ),
        ),
      ],
    );
  }
}

class ProductInfoSection extends StatelessWidget {
  final ProductConstructor product;

  const ProductInfoSection({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overview',
            style: FontTheme.bodyText.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: screenHeight * 0.035),
          ProductMetrics(product: product),
          SizedBox(height: screenHeight * 0.02),
          Text(
            'About',
            style: FontTheme.bodyText.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
              height: screenHeight * 0.12,
              child: SingleChildScrollView(
                child: Text(
                  '''The Monstera Adansonii grows best in a well-draining Aroid mix using bark, perlite, peat moss, and charcoal. Keep your plant in bright indirect light and humidity above 60%. When watering, make sure that the potting mix of your Adansonii remains slightly moistCrassula Ovata or Jade Plant, Paradise Tree or Silver Leaf Tree. This plant will filter the air and protect you from dust and help bring positive energy into the grower's home.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consectetur doloribus, facere corporis, recusandae hic cupiditate itaque voluptas ad, eaque sed iure? Sequi rerum quibusdam perspiciatis nobis molestias incidunt explicabo dolorum?''',
                  style: FontTheme.detailText,
                ),
              ))
        ],
      ),
    );
  }
}

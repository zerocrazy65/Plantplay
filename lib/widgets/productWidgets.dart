import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../middleware/connect.dart';
import '../theme/style.dart';

class ProductImageSection extends StatelessWidget {
  final ProductConstructor product;

  const ProductImageSection({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(12),
        bottomRight: Radius.circular(12),
      ),
      child: Container(
        color: Color(0xFFD7E6D9),
        height: 435,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 20, top: 20),
              child: ProductHeader(product: product),
            ),
            const SizedBox(height: 25),
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
              height: 274,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    bottom: 0,
                    right: -20,
                    child: Image.asset(
                      '${product.img}',
                      height: 280,
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FavoriteButton(),
                SizedBox(width: 20),
                ShoppingBagButton(),
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

class ShoppingBagButton extends StatelessWidget {
  const ShoppingBagButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        width: 55,
        height: 55,
        color: ColorTheme.mainGreenColor,
        child: TextButton(
          child: const Icon(
            Icons.shopping_bag_outlined,
            size: 36,
            color: Colors.white,
          ),
          onPressed: () {},
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
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
          color: ColorTheme.highlightColor,
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: FontTheme.bodyText.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
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
    return Padding(
      padding: const EdgeInsets.all(25),
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
          const SizedBox(height: 25),
          ProductMetrics(product: product),
          const SizedBox(height: 15),
          Text(
            'About',
            style: FontTheme.bodyText.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
              height: 110,
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

import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/style.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../middleware/connect.dart';
import '../../widgets/productWidgets.dart';

class ProductPage extends StatefulWidget {
  final int index;

  const ProductPage({Key? key, required this.index}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int? id;
  Future<List<ProductConstructor>>? productDetail;

  @override
  void initState() {
    super.initState();
    id = widget.index;
    productDetail = productReq(id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FutureBuilder(
            future: productDetail,
            builder: (BuildContext ctx,
                AsyncSnapshot<List<ProductConstructor>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData) {
                return const Center(
                  child: Text('No data'),
                );
              } else {
                return Column(
                  children: snapshot.data!.map((product) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductImageSection(product: product),
                        ProductInfoSection(product: product),
                      ],
                    );
                  }).toList(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

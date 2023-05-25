import 'package:flutter/material.dart';

import '../../middleware/connect.dart';

class ProductPage extends StatefulWidget {
  final int index;

  const ProductPage({Key? key, required this.index}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Index: ${widget.index}'),
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
                  return Center(
                    child: Column(
                      children: snapshot.data!.map((product) {
                        return Column(
                          children: [
                            Text('Product Image: ${product.img}'),
                            Text('Product Name: ${product.name}'),
                            Text('Product Price: ${product.price}'),
                            Text('Product Description: ${product.describe}'),
                            Text('Product Rating: ${product.rating}'),
                            Text('Product Detail - Light: ${product.light}'),
                            Text(
                                'Product Detail - Temperature: ${product.temp}'),
                            Text('Product Detail - Water: ${product.water}'),
                          ],
                        );
                      }).toList(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

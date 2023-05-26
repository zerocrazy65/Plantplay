import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/style.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: //Center(
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Text('Index: ${widget.index}'),
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
                  return //Center(
                    Column(
                      children: snapshot.data!.map((product) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
                              child: Container(
                                color: Color(0xFFD7E6D9),
                                height: 435,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 10, right: 20, top: 20),
                                      child: 
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                                onPressed: () {}, 
                                                icon: const Icon(
                                                  Icons.arrow_back_ios_new,
                                                  size: 35,
                                                  color: ColorTheme.purpleColor,
                                                )
                                              ),
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(4),
                                              child: Container(
                                                color: ColorTheme.mainGreenColor,
                                                child: Padding(
                                                  padding: EdgeInsets.only(top: 3, bottom: 3, left: 8, right: 8),
                                                  child: Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.star,
                                                        size: 20,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(width: 6,),
                                                      Text(
                                                        '${product.rating}',
                                                        style: GoogleFonts.quicksand(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w500,
                                                          color: Colors.white
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ),
                                            )
                                          ],
                                        ),
                                    ),
                                    SizedBox(height: 25),
                                    Padding(
                                      padding: EdgeInsets.only(left: 25),
                                      child: Text(
                                        '${product.type}',
                                        style: GoogleFonts.quicksand(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: ColorTheme.purpleColor
                                        )
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Padding(
                                      padding: EdgeInsets.only(left: 25),
                                      child: Text(
                                        '${product.name}',
                                        style: FontTheme.headerText.copyWith(
                                          fontSize: 30
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 274,
                                      child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [Positioned(
                                          bottom: 0,
                                          right: -20,
                                          child: Image.asset(
                                              '${product.img}',
                                              // width: 280,
                                              height: 280,
                                              fit: BoxFit.cover,
                                            )
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 25),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'PRICE \$${product.price}',
                                                    style: FontTheme.bodyText,
                                                  ),
                                                  SizedBox(height: 20),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(4),
                                                        child: Container(
                                                          width: 55,
                                                          height: 55,
                                                          color: Colors.white,
                                                          child: TextButton(
                                                            child: Icon(
                                                            Icons.favorite,
                                                            size: 36,
                                                            color: ColorTheme.mainGreenColor,
                                                            ),
                                                            onPressed: () {
                                                            
                                                            },
                                                          )
                                                        ),
                                                      ),
                                                      SizedBox(width: 20),
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(4),
                                                        child: Container(
                                                          width: 55,
                                                          height: 55,
                                                          color: ColorTheme.mainGreenColor,
                                                          child: TextButton(
                                                            child: Icon(
                                                            Icons.shopping_bag_outlined,
                                                            size: 36,
                                                            color: Colors.white,
                                                            ),
                                                            onPressed: () {
                                                            
                                                            },
                                                          )
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(height: 20)

                                                ],
                                              ),

                                            ],
                                          ),
                                        ),
                                        ],
                                      ),
                                    )
                                  ]
                                ),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.all(25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Overview',
                                      style: FontTheme.bodyText.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    SizedBox(height: 25),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Icon(
                                              Icons.sunny,
                                              size: 30,
                                              color: ColorTheme.highlightColor,
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'LIGHT',
                                              style: FontTheme.bodyText.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              '${product.light}%',
                                              style: FontTheme.bodyText.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: ColorTheme.highlightColor
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Icon(
                                              Icons.thermostat,
                                              size: 30,
                                              color: ColorTheme.highlightColor,
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'TEMPERATURE',
                                              style: FontTheme.bodyText.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              '${product.temp}-${product.temp !+ 20} \u2109',
                                              style: FontTheme.bodyText.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: ColorTheme.highlightColor
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Icon(
                                              Icons.water_drop,
                                              size: 30,
                                              color: ColorTheme.highlightColor,
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'WATER',
                                              style: FontTheme.bodyText.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              '${product.water}ml',
                                              style: FontTheme.bodyText.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: ColorTheme.highlightColor
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 30),
                                    Text(
                                      'About',
                                      style: FontTheme.bodyText.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    Text(
                                      '${product.describe}',
                                      
                                    )
                                  ]
                                ),
                              ),
                            
                            
                            
                            
                            // Text('Product Image: ${product.img}'),
                            // Text('Product Name: ${product.name}'),
                            // Text('Product Price: ${product.price}'),
                            // Text('Product Description: ${product.describe}'),
                            // Text('Product Type: ${product.type}'),
                            // Text('Product Rating: ${product.rating}'),
                            // Text('Product Detail - Light: ${product.light}'),
                            // Text('Product Detail - Temperature: ${product.temp}'),
                            // Text('Product Detail - Water: ${product.water}'),
                          ],
                        );
                      }).toList(),
                    );
                  // );
                }
              },
            ),
          ],
        //),
      ),
    );
  }
}

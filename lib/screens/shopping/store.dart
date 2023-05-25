import 'package:flutter/material.dart';
import 'package:flutter_application_1/middleware/connect.dart';
import 'package:flutter_application_1/screens/shopping/productPage.dart';
import 'package:flutter_application_1/theme/style.dart';
import 'package:flutter_application_1/widgets/slider.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => StorePageState();
}

class StorePageState extends State<StorePage> {
  Future? storeData;
  @override
  void initState() {
    super.initState();
    storeData = storeReq();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.05,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              'assets/logo/Logo-PLANTPLAY.png',
              height: 50,
              width: 150,
            ),
          ),
          const SizedBox(
            height: 250,
            width: double.infinity,
            child: SliderWidget(),
          ),
          // const Text('Search Maybe'),
          // SizedBox(
          //   height: screenHeight * 0.02,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/icons/_indoor.png',
              ),
              Image.asset(
                'assets/icons/_flower.png',
              ),
              Image.asset(
                'assets/icons/_green.png',
              ),
            ],
          ),
          FutureBuilder(
            future: storeData,
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Center(
                        child: Text(
                      "No data",
                      style: FontTheme.bodyText,
                    )),
                  ],
                );
              } else {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                              mainAxisExtent: 210),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductPage(
                                        index: snapshot.data[index].id)))
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Card(
                              child: Column(
                                children: [
                                  Container(
                                    color: ColorTheme.bgCartColor,
                                    width: 250,
                                    child: Image.asset(
                                      snapshot.data[index].img,
                                      width: 152,
                                      height: 152,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.zero,
                                    height: 50,
                                    color: ColorTheme.mainGreenColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data[index].name,
                                            style: FontTheme.buttonText,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines:
                                                1, // Limit text to one line
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '\$${snapshot.data[index].price}',
                                                style: FontTheme.buttonText,
                                                overflow: TextOverflow
                                                    .ellipsis, // Show ellipsis when text overflows
                                                maxLines:
                                                    1, // Limit text to one line
                                              ),
                                              const Icon(
                                                Icons.keyboard_arrow_right,
                                                color: ColorTheme.whiteColor,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

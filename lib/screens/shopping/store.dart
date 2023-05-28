import 'package:flutter/material.dart';
import 'package:flutter_application_1/middleware/connect.dart';
import 'package:flutter_application_1/screens/shopping/product.dart';
import 'package:flutter_application_1/theme/style.dart';
import 'package:flutter_application_1/widgets/storeWidgets.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => StorePageState();
}

class StorePageState extends State<StorePage> {
  Future? storeData;
  int activeButtonIndex = 0;
  String? modeSelected = 'Indoor';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ColorChangeButton(
                imagePath: 'assets/icons/_indoor.png',
                isActive: activeButtonIndex == 0,
                onPressed: () {
                  setState(() {
                    activeButtonIndex = 0;
                    modeSelected = 'Indoor';
                  });
                },
              ),
              ColorChangeButton(
                imagePath: 'assets/icons/_flower.png',
                isActive: activeButtonIndex == 1,
                onPressed: () {
                  setState(() {
                    activeButtonIndex = 1;
                    modeSelected = 'Flower';
                  });
                },
              ),
              ColorChangeButton(
                imagePath: 'assets/icons/_green.png',
                isActive: activeButtonIndex == 2,
                onPressed: () {
                  setState(() {
                    activeButtonIndex = 2;
                    modeSelected = 'Green';
                  });
                },
              ),
            ],
          ),
          FutureBuilder(
            future: storeData,
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Column(
                  children: [
                    const SizedBox(height: 100),
                    Center(
                      child: Text(
                        "No data",
                        style: FontTheme.bodyText,
                      ),
                    ),
                  ],
                );
              } else {
                final filteredData = snapshot.data
                    .where((item) => item.type == modeSelected)
                    .toList();

                if (filteredData.isEmpty) {
                  return Column(
                    children: [
                      const SizedBox(height: 100),
                      Center(
                        child: Text(
                          "No data for the selected mode",
                          style: FontTheme.bodyText,
                        ),
                      ),
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
                          mainAxisExtent: 210,
                        ),
                        itemCount: filteredData.length,
                        itemBuilder: (context, index) {
                          final item = filteredData[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductPage(
                                    index: item.id,
                                    mockActive: false,
                                  ),
                                ),
                              );
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
                                        item.img,
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
                                              item.name,
                                              style: FontTheme.buttonText,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '\$${item.price}',
                                                  style: FontTheme.buttonText,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
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
              }
            },
          ),
        ],
      ),
    );
  }
}

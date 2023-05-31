import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/provider/favoriteProviders.dart';
import 'package:flutter_application_1/theme/style.dart';
import 'package:provider/provider.dart';

import '../screens/shopping/product.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoritesProvider>(context);
    final favoriteStore = favoriteProvider.favoriteStore;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    bool activityShow = true;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
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
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Favorites",
                      style: FontTheme.headerText,
                    ),
                    SizedBox(
                      width: screenWidth * 0.3,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (favoriteStore.isEmpty)
                    Column(
                      children: [
                        Image.asset('assets/img/heartEmpty.png'),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Text(
                          'No favorites yet',
                          style: FontTheme.bodyText,
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        Text(
                          'Save your favorite products and',
                          style: FontTheme.subBodyText,
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        Text(
                          'find them here later.',
                          style: FontTheme.subBodyText,
                        ),
                      ],
                    )
                  else
                    Expanded(
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
                          itemCount: favoriteStore.length,
                          itemBuilder: (context, index) {
                            final item = favoriteStore[index];
                            return Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductPage(
                                          index: item.id!,
                                          activityShow: activityShow,
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
                                              item.img!,
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
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    item.name!,
                                                    style: FontTheme.buttonText,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        '\$${item.price}',
                                                        style: FontTheme
                                                            .buttonText,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                      ),
                                                      const Icon(
                                                        Icons
                                                            .keyboard_arrow_right,
                                                        color: ColorTheme
                                                            .whiteColor,
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
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      // Remove item from favoriteStore
                                      favoriteProvider
                                          .removeFromFavorites(item);
                                    },
                                    child: Transform.scale(
                                      scale: 1.3,
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.red[400],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

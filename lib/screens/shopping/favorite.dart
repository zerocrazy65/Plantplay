import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/theme/style.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<String> cartStore = [];
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
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
              ))),
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
                  if (cartStore.isEmpty)
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
                    Column(
                      children: [
                        for (var item in cartStore) Text(item),
                      ],
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

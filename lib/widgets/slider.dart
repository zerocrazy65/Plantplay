import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => SliderWidgetState();
}

class SliderWidgetState extends State<SliderWidget> {
  int activeIndex = 0;
  final images = [
    'assets/img/Card-1.png',
    'assets/img/Card-2.png',
    'assets/img/Card-3.png',
    'assets/img/Card-4.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            CarouselSlider.builder(
                itemCount: images.length,
                itemBuilder: (context, index, realIndex) {
                  final image = images[index];

                  return buildImage(image, index);
                },
                options: CarouselOptions(
                    height: 220,
                    viewportFraction: 1,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index))),
            const SizedBox(height: 5),
            buildIndicator(),
          ]),
    );
  }

  Widget buildImage(String image, int index) => ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20)),
      child: Stack(
        children: [
          Container(
            // margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            color: Colors.grey,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          )
        ],
      ));

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: images.length,
        effect: const ExpandingDotsEffect(
            activeDotColor: ColorTheme.introPageColor,
            dotWidth: 5,
            dotHeight: 5),
      );
}

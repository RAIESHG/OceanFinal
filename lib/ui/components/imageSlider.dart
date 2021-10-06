import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ocean_publication/ui/components/networkImageRequest/networkImage_view.dart';

class ImageSlideShows extends StatelessWidget {
  final List imageList;
  const ImageSlideShows({Key? key, required this.imageList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarouselController buttonCarouselController = CarouselController();
    List<Widget> imgList = [];
    for (int i = 0; i < imageList.length; i++) {
      if (imageList[i].contains('assets')) {
        imgList.add(
          Container(
            child: Image.asset(
              '${imageList[i]}',
              fit: BoxFit.contain,
            ),
          ),
        );
        // } else if (imageList.contains("imageserver")) {
        //   imgList.add(NetworkImageC(imgLink: "$imgUrl/${imageList[i]}"));
        // }
      } else {
        imgList.add(
          NetworkImageC(
            imgLink: imageList[i],
          ),
        );
      }
    }
    imgList.shuffle();
    return CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 0.6,
          height: 200.0,
          enableInfiniteScroll: true,
          initialPage: 2,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        carouselController: buttonCarouselController,
        items: imgList);
  }
}

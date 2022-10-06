import 'package:carousel_scratch/my_clipper.dart';
import 'package:carousel_scratch/selected_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CarouselApp extends StatefulWidget {
  CarouselApp({Key? key}) : super(key: key);

  @override
  State<CarouselApp> createState() => _CarouselAppState();
}

class _CarouselAppState extends State<CarouselApp> {
  int photoIndex = 0;

  List<String> photos = [
    'images/alex-suprun-A53o1drQS2k-unsplash.jpg',
    'images/pexels-albert-nunez-88630.jpg',
    'images/pexels-megapixelstock-18296.jpg',
    'images/pexels-sourav-mishra-1149831.jpg'
  ];

  int prevImg() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
    });

    return photoIndex;
  }

  int nextImg() {
    setState(() {
      photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : photoIndex;
    });
    return photoIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel App'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: 330,
                child: Stack(
                  children: [
                    Container(
                      width: 340,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(photos[photoIndex].toString()),
                          ),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Positioned(
                        right: 0,
                        top: 150,
                        child: IconButton(
                            onPressed: nextImg,
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.black54,
                                  offset: Offset(1, 1.2),
                                  blurRadius: 5,
                                )
                              ],
                            ))),
                    Positioned(
                        left: 0,
                        top: 150,
                        child: GestureDetector(
                          child: IconButton(
                              onPressed: prevImg,
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    color: Colors.black54,
                                    offset: Offset(-1, -1.2),
                                    blurRadius: 5,
                                  )
                                ],
                              )),
                        )),
                    Positioned(
                        bottom: 20,
                        left: 20,
                        right: 20,
                        child: SelectedPhoto(
                          numberOfDots: photos.length,
                          photoIndexNo: photoIndex,
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shoes_app/services/shoes.dart';

class ShoesDetail extends StatefulWidget {
  const ShoesDetail({super.key});

  @override
  State<ShoesDetail> createState() => _ShoesState();
}

class _ShoesState extends State<ShoesDetail> {

  List<int> sizeList = [40, 42, 44, 46];
  int selectedSize = 42;

  String getShoesType(ShoesType type) {
    switch(type) {
      case ShoesType.football:
        return 'Football';
      case ShoesType.soccer:
        return 'Soccer';
      default:
        return 'Sneakers';
    }
  }

  @override
  Widget build(BuildContext context) {

    final shoesData = ModalRoute.of(context)?.settings.arguments as Shoes;

    return Scaffold(
      body: Hero(
        tag: shoesData.tag,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(image:  AssetImage(shoesData.image,), fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 10,
                    offset: const Offset(0, 10),
                  )
                ]
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_ios, color: Colors.white,),
                        ),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(Icons.favorite_border, size: 20,),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                      left: 0,
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            colors: [
                              Colors.black.withOpacity(.9),
                              Colors.black.withOpacity(.0),
                            ]
                          )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FadeInUp(
                              duration: const Duration(milliseconds: 1300),
                              child: Text(getShoesType(shoesData.type), style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 50
                              ),),
                            ),
                            const SizedBox(height: 25,),
                            FadeInUp(
                              duration: const Duration(milliseconds: 1400),
                              child: const Text('Size', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                              ),),
                            ),
                            const SizedBox(height: 10,),
                            Row(
                                children: sizeList.map((e) {
                                  int index = sizeList.indexOf(e);
                                  int duration = 1450 + index * 10;

                                  return FadeInUp(
                                    duration: Duration(milliseconds: duration),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedSize = e;
                                        });
                                      },
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        margin: const EdgeInsets.only(right: 20),
                                        decoration: BoxDecoration(
                                          color: e == selectedSize ? Colors.white : Colors.transparent,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Center(child: Text(e.toString(), style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: e == selectedSize ? null : Colors.white
                                        ),)),
                                      ),
                                    ),
                                  );
                                }).toList(),
                            ),
                            const SizedBox(height: 60,),
                            FadeInUp(
                              duration: const Duration(milliseconds: 1500),
                              child: TextButton(
                                onPressed: () {
                                  print('WLLWL');
                                },
                                style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 50)),
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                ),
                                child: const Center(
                                    child: Text('Buy Now', style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30,),
                          ],
                        ),
                      )
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

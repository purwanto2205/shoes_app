import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shoes_app/services/shoes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  List<Shoes> listCard = [
    Shoes(tag: 'red', image: 'assets/images/one.jpg', type: ShoesType.sneakers, price: '600', brand: 'Nike', ),
    Shoes(tag: 'blue', image: 'assets/images/two.jpg', type: ShoesType.sneakers, price: '800', brand: 'Nike', ),
    Shoes(tag: 'white', image: 'assets/images/three.jpg', type: ShoesType.sneakers, price: '500', brand: 'Nike', ),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Shoes', style: TextStyle(
          color: Colors.black,
          fontSize: 25.0,
        ),),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none)
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child:  Column(
            children: [
              SizedBox(
                height: 40.0,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 2.2/1,
                        child: FadeInUp(
                          duration: const Duration(microseconds: 1000),
                          child: Container(
                            margin: const EdgeInsets.only(right: 10.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)
                            ),
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Center(
                                    child: Text('All',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),),
                                  )
                              )
                          ),
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: 3.2/1,
                        child: FadeInUp(
                          duration: const Duration(microseconds: 1000),
                          child: Container(
                              margin: const EdgeInsets.only(right: 10.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Center(
                                    child: Text('Sneakers',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),),
                                  )
                              )
                          ),
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: 3.2/1,
                        child: FadeInUp(
                          duration: const Duration(microseconds: 1000),
                          child: Container(
                              margin: const EdgeInsets.only(right: 10.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Center(
                                    child: Text('Football',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),),
                                  )
                              )
                          ),
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: 3.2/1,
                        child: FadeInUp(
                          duration: const Duration(microseconds: 1000),
                          child: Container(
                              margin: const EdgeInsets.only(right: 10.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Center(
                                    child: Text('Soccer',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),),
                                  )
                              )
                          ),
                        ),
                      )
                    ],
                  ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Column(
                children: listCard.map((e) => FadeInUp(
                    duration: const Duration(milliseconds: 1500),
                    child: makeItem(e, context)
                )).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget makeItem(Shoes item, context) {

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

  return Hero(
    tag: item.tag,
    child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/shoes', arguments: item);
      },
      child: Container(
        height: 250,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(item.image)
            ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 10),
                blurRadius: 10,
                color: Colors.grey.shade400,
              )
            ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInUp(
                          duration: const Duration(milliseconds: 1000),
                          child: Text(getShoesType(item.type), style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),)
                      ),
                      const SizedBox(height: 10,),
                      FadeInUp(
                          duration: const Duration(milliseconds: 1100),
                          child: Text(item.brand, style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white
                          ),)
                      ),
                    ],
                  ),
                ),
                FadeInUp(
                  duration: const Duration(milliseconds: 1200),
                  child: Container(
                      width: 35,
                      height: 35,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Center(
                          child: Icon(Icons.favorite_border, size: 20,)
                      )
                  ),
                ),
              ],
            ),
            FadeInUp(
              duration: const Duration(milliseconds: 1200),
              child: Text('${item.price}\$', style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),),
            ),
          ],
        ),
      ),
    ),
  );
}
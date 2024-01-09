enum ShoesType { sneakers, football, soccer, all }

class Shoes {
  String tag;
  String image;
  ShoesType type;
  String price;
  String brand;

  Shoes({
    required this.tag,
    required this.image,
    required this.type,
    required this.price,
    required this.brand,
  });

}
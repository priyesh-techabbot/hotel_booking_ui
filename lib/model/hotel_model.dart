class HotelModel {
  List<String> image;
  String name;
  int price;
  int offerPrice;
  int tax;
  int review;
  double rating;
  BedInfoModel bedInfo;

  HotelModel({
    required this.image,
    required this.name,
    required this.price,
    required this.offerPrice,
    this.tax = 120,
    required this.review,
    required this.rating,
    required this.bedInfo,
  });
}

class BedInfoModel {
  int bedroom;
  int beds;
  int guest;
  int bathroom;

  BedInfoModel({
    required this.bedroom,
    required this.beds,
    required this.guest,
    required this.bathroom,
  });
}

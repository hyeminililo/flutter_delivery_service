import 'package:flutter_delivery_app/common/const/data.dart';

enum RestaurantPriceRange { expansive, medium, cheap }

//  반복적이더라도 모델링을 하는 이유는 요청을 가져왔을 때 인스턴스로 무조건 받아와야하는데 많이 사용하는모델이니까
class RestaurantModel {
  //postman에서  받은 string 값
  final String id;
  final String name;
  final String thumubUrl;
  final List<String> tags;
  final RestaurantPriceRange priceRange;
  final double ratings;
  final int ratingCount;
  final int deliveryTime;
  final int deliveryFee;

  RestaurantModel(
      {required this.id,
      required this.name,
      required this.thumubUrl,
      required this.tags,
      required this.priceRange,
      required this.ratings,
      required this.ratingCount,
      required this.deliveryTime,
      required this.deliveryFee});

// json으로 부터 데이터를 가져온다는 의미의 factory 생성자 생성
  factory RestaurantModel.formJson({
    // dart에서는 json을 가져올 때 보통 맵으로 스트링과 다이나믹으로 가져온다
    required Map<String, dynamic> json,
  }) {
    return RestaurantModel(
      id: json['id'],
      name: json['name'],
      thumubUrl: 'http://$ip${json['thumbUrl']}',
      tags: json['tags'],
      priceRange: RestaurantPriceRange.values
          .firstWhere((e) => e.name == json['priceRange']),
      ratings: json['ratings'],
      ratingCount: json['ratingCount'],
      deliveryTime: json['deliveryTime'],
      deliveryFee: json['deliveryFee'],
    );
  }
}

import 'package:isar/isar.dart';
part 'mobile_model.g.dart';

@collection
class MobileModel {
   Id id = Isar.autoIncrement; // you can also use id = null to auto increment
  String? title;
  String? color;
  String? memory;
  String? price;
  String? createdAt;
  String? img;

  MobileModel(
      {this.title,
      this.color,
      this.memory,
      this.price,
      this.createdAt,
      this.img});

  MobileModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    color = json['color'];
    memory = json['memory'];
    price = json['price'];
    createdAt = json['created_at'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['color'] = this.color;
    data['memory'] = this.memory;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['img'] = this.img;
    return data;
  }
}

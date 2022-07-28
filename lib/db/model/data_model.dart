import 'package:hive_flutter/hive_flutter.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class GalleryModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String image;

  GalleryModel({
    this.id,
    required this.image,
  });
}

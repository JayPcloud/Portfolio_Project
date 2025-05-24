import 'package:cloud_firestore/cloud_firestore.dart';

class SkillModel {
  String? name,stack, imageUrl;
  bool? isSvg;

  SkillModel({
    required this.name,
    required this.stack,
    required this.imageUrl,
    this.isSvg
  });

  SkillModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    stack = json['stack'];
    imageUrl = json['image_url'];
    isSvg = json['is_svg'] ?? true;
  }

  static List<SkillModel> listFromJson(List<QueryDocumentSnapshot<Map<String, dynamic>>> json) {
    return json.map((e) => SkillModel.fromJson(e.data()),).toList();
  }
}

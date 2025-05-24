import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectModel {
  String? title, description, githubLink, imageUrl;
  List<String>? techsUsed;
  List<Feature>? features;

  ProjectModel({
    required this.title,
    required this.techsUsed,
    required this.features,
    required this.description,
    required this.githubLink,
    required this.imageUrl,
  });

  ProjectModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    techsUsed = json['technology_used'].cast<String>();
    features = Feature.listFromJson(json['features'].cast<Map<String, dynamic>>());
    description = json['description'];
    githubLink = json['github_url'];
    imageUrl = json['image_url'];
  }

  static List<ProjectModel> listFromJson(List<QueryDocumentSnapshot<Map<String, dynamic>>> json) {
    return json.map((e) => ProjectModel.fromJson(e.data())).toList();
  }

}


class Feature {
  String? title, description;

  Feature({
    required this.title,
    required this.description,
  });

  Feature.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }

  static List<Feature> listFromJson(List<Map<String, dynamic>> json) {
    return json.map((e) => Feature.fromJson(e),).toList();
  }

}




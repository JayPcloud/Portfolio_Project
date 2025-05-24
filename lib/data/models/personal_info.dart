class PersonalInfoModel {
  String? firstname, lastname, role, specialization, aboutMe, location;
  List<String>? topSkills;

  PersonalInfoModel({
    required this.firstname,
    required this.lastname,
    required this.aboutMe,
    required this.location,
    required this.specialization,
    required this.role,
    required this.topSkills,
  });

  PersonalInfoModel.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    location = json['location'];
    aboutMe = json['about_me'];
    specialization = json['specialization'];
    role = json['role'];
    topSkills = json['top_skills'].cast<String>();
  }

}

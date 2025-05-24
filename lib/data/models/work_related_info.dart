class WorkInfoModel {
  String? cv, repositories, workExperience, projectsDone, skillsWriteUp;

  WorkInfoModel({
    required this.cv,
    required this.projectsDone,
    required this.workExperience,
    required this.repositories,
    required this.skillsWriteUp
  });

  WorkInfoModel.fromJson(Map<String, dynamic> json) {
    cv = json['cv_url'];
    projectsDone = json['projects_done'];
    workExperience = json['work_experience'];
    repositories = json['repositories'];
    skillsWriteUp = json['skills_writeup'];
  }

}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/data/models/personal_info.dart';
import 'package:portfolio/data/models/project.dart';
import 'package:portfolio/data/models/skill_model.dart';
import 'package:portfolio/data/models/social_contacts.dart';
import 'package:portfolio/data/models/work_related_info.dart';
import 'package:portfolio/utils/utils_func.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/models/message.dart';

class BodyController {
  
  BodyController._();

  static final instance = BodyController._();
  
  final _firestore = FirebaseFirestore.instance;

  late ContactModel contacts;

  late PersonalInfoModel personalInfo;

  late WorkInfoModel workRelatedInfo;

  late List<ProjectModel> projects;

  late List<SkillModel> skills;

  RxBool isDownloadingCv = false.obs;

  RxBool isMessageSending = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey();

  final List<TextEditingController> messageTextControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  Future<void> fetchPortfolioData() async {
    final aboutDocs = await _firestore.collection('about').get();
    final projectDocs = await _firestore.collection('projects').get();
    final skillDocs = await _firestore.collection('skills').get();

    contacts = ContactModel.fromJson(aboutDocs.docs.where((doc) => doc.id == 'contact').toList()[0].data());
    personalInfo = PersonalInfoModel.fromJson(aboutDocs.docs.where((doc) => doc.id == 'personal_info').toList()[0].data());
    workRelatedInfo = WorkInfoModel.fromJson(aboutDocs.docs.where((doc) => doc.id == 'work_related_Info').toList()[0].data());
    projects = ProjectModel.listFromJson(projectDocs.docs.cast<QueryDocumentSnapshot<Map<String, dynamic>>>());
    skills = SkillModel.listFromJson(skillDocs.docs);
  }

  static void pLaunchUrl(String url,) async{
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  static void launchEmail(String email) async{
    final emailUri = Uri(
      scheme: 'mailto',
      path: email,
      //query: 'subject=Hello&body=Hi%20there!',
    );

    await launchUrl(emailUri);
  }

  // void downloadCV () async {
  //   try {
  //     isDownloadingCv.value = true;
  //     final uri = Uri.parse(workRelatedInfo.cv??Texts.cvDownloadUrl);
  //     await launchUrl(uri, mode: LaunchMode.inAppWebView);
  //     isDownloadingCv.value = false;
  //     UtilsFunc.showSnackBar('CV Downloaded');
  //   } catch(e) {
  //     print(e.toString());
  //     isDownloadingCv.value=false;
  //   }
  // }

  Future<void> viewProjectDetails() async {

  }


  void sendMessage() async {
    if(formKey.currentState!.validate()) {
      if(!isMessageSending.value) {
        try {
          isMessageSending.value = true;
          final Message message = Message(
            name: messageTextControllers[0].text,
            company: messageTextControllers[1].text,
            email: messageTextControllers[2].text,
            phone: messageTextControllers[3].text,
            message: messageTextControllers[4].text,
          );
          await _firestore.collection('messages').add(
              message.toJson()
          );
          UtilsFunc.showSnackBar(
              message:'Thanks for reaching out. I will reply shortly via Email',
              context:Get.context!,
              titleWidget: Row(
                spacing: 10,
                children: [
                  Text('Sent'),
                  Icon(Icons.check, color: Colors.green,)
                ],)
          );
          isMessageSending.value = false;
          formKey.currentState!.reset();
        } catch (e) {
          isMessageSending.value = false;
          UtilsFunc.showSnackBar(
              message:'Please make sure your internet connection is stable and try again',
              context:Get.context!,
              titleWidget: Row(
                spacing: 10,
                children: [
                  Text('Error'),
                  Icon(Icons.close, color: Colors.red,)
                ],)
          );
        }
      }

    }
  }


}
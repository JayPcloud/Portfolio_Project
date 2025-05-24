class ContactModel {
   String? email,
      phone,
      upworkProfileUrl,
      telegramContactUrl,
      githubProfileUrl,
      xProfileUrl,
      whatsappContactUrl,
       igProfileUrl,
       discordProfile;

  ContactModel({
    required this.email,
    required this.phone,
    required this.whatsappContactUrl,
    required this.githubProfileUrl,
    required this.xProfileUrl,
    required this.telegramContactUrl,
    required this.upworkProfileUrl,
    required this.igProfileUrl,
    required this.discordProfile,
  });

  ContactModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
    whatsappContactUrl = json['whatsapp'];
    xProfileUrl = json['xTwitter'];
    githubProfileUrl = json['github'];
    telegramContactUrl = json['telegram'];
    upworkProfileUrl = json['upwork'];
    igProfileUrl = json['instagram'];
  }

}

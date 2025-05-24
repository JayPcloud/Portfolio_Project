class Message {
  String? name, company, email, phone, message;

  Message({
    required this.name,
    required this.company,
    required this.email,
    required this.phone,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['name'] = name;
    map['company_name'] = name;
    map['email'] = name;
    map['phone'] = name;
    map['message'] = name;

    return map;
  }
}

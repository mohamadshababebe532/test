class AddAgentModel {
  int? id;
  String? name;
  String? company_name;
  String? work_category;
  String? email;
  String? land_line;
  String? phone_number;
  String? type;
  String? website;
  String? location;
  String? country;
  AddAgentModel(
      {this.company_name,
      this.name,
      this.country,
      this.email,
      this.id,
      this.land_line,
      this.location,
      this.phone_number,
      this.type,
      this.website,
      this.work_category});

  AddAgentModel.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    name = json['name'] ?? '';
    work_category = json['work_category'] ?? '';
    land_line = json['land_line'] ?? '';
    website = json['website'] ?? '';
    location = json['location'] ?? '';
    country = json['country'] ?? '';
    company_name = json['company_name'] ?? '';
    phone_number = json['phone_number'] ?? '';
    email = json['email'] ?? '';
    type = json['type'] ?? '';
  }
}

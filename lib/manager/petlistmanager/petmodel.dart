class PetModel {
  String? name;
  String? age;
  String? kind;
  String? vaccine;
  String? imageUrl;

  PetModel({this.name, this.age, this.kind, this.vaccine, this.imageUrl});

  PetModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    kind = json['kind'];
    vaccine = json['vaccine'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['kind'] = this.kind;
    data['vaccine'] = this.vaccine;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}

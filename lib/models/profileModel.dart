class ProfileModel {
  String? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? fullName;
  Null? gender;
  Null? phoneNumber;
  Null? profilePhoto;
  Null? country;
  Null? city;

  ProfileModel(
      {this.id,
      this.username,
      this.email,
      this.firstName,
      this.lastName,
      this.fullName,
      this.gender,
      this.phoneNumber,
      this.profilePhoto,
      this.country,
      this.city});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    gender = json['gender'];
    phoneNumber = json['phone_number'];
    profilePhoto = json['profile_photo'];
    country = json['country'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['full_name'] = this.fullName;
    data['gender'] = this.gender;
    data['phone_number'] = this.phoneNumber;
    data['profile_photo'] = this.profilePhoto;
    data['country'] = this.country;
    data['city'] = this.city;
    return data;
  }
}

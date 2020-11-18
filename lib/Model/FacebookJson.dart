class FacebookResponse {
  String id;
  String birthday;
  String firstName;
  String gender;
  String lastName;
  String email;
  String link;
  Location location;
  String locale;
  String name;
  int timezone;
  String updatedTime;
  bool verified;

  FacebookResponse(
      {this.id,
        this.birthday,
        this.firstName,
        this.gender,
        this.lastName,
        this.email,
        this.link,
        this.location,
        this.locale,
        this.name,
        this.timezone,
        this.updatedTime,
        this.verified});

  FacebookResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    birthday = json['birthday'];
    firstName = json['first_name'];
    gender = json['gender'];
    lastName = json['last_name'];
    email = json['email'];
    link = json['link'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    locale = json['locale'];
    name = json['name'];
    timezone = json['timezone'];
    updatedTime = json['updated_time'];
    verified = json['verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['birthday'] = this.birthday;
    data['first_name'] = this.firstName;
    data['gender'] = this.gender;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['link'] = this.link;
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    data['locale'] = this.locale;
    data['name'] = this.name;
    data['timezone'] = this.timezone;
    data['updated_time'] = this.updatedTime;
    data['verified'] = this.verified;
    return data;
  }
}

class Location {
  String id;
  String name;

  Location({this.id, this.name});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class RegisterResponse {
  User user;
  String token;

  RegisterResponse({this.user, this.token});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  int id;
  String name;
  Null description;
  String email;
  String type;
  String startTime;
  Null endTime;
  Null startDate;
  Null endDate;
  Null commercialReg;
  // List<Null> skills;
  // List<Null> categories;
  int rates;
  ProjectCounter projectCounter;
  ProjectCounter bidsCounter;
  ProjectCounter projectNumber;
  String avatar;
  Null register;
  Null statistics;
  String mobile;
  int verified;
  Null setting;
  Null workshopName;
  // List<Null> comments;
 // Location location;
  Null notificationSettings;

  User(
      {this.id,
        this.name,
        this.description,
        this.email,
        this.type,
        this.startTime,
        this.endTime,
        this.startDate,
        this.endDate,
        this.commercialReg,
        // this.skills,
        // this.categories,
        this.rates,
        this.projectCounter,
        this.bidsCounter,
        this.projectNumber,
        this.avatar,
        this.register,
        this.statistics,
        this.mobile,
        this.verified,
        this.setting,
        this.workshopName,
        // this.comments,
      //  this.location,
        this.notificationSettings});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    email = json['email'];
    type = json['type'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    commercialReg = json['commercial_reg'];


    rates = json['rates'];
    projectCounter = json['projectCounter'] != null
        ? new ProjectCounter.fromJson(json['projectCounter'])
        : null;
    bidsCounter = json['bidsCounter'] != null
        ? new ProjectCounter.fromJson(json['bidsCounter'])
        : null;
    projectNumber = json['projectNumber'] != null
        ? new ProjectCounter.fromJson(json['projectNumber'])
        : null;
    avatar = json['avatar'];
    register = json['register'];
    statistics = json['statistics'];
    mobile = json['mobile'];
    verified = json['verified'];
    setting = json['setting'];
    workshopName = json['workshop_name'];

    // location = json['location'] != null
    //     ? new Location.fromJson(json['location'])
    //     : null;
    notificationSettings = json['notification_settings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['email'] = this.email;
    data['type'] = this.type;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['commercial_reg'] = this.commercialReg;


    data['rates'] = this.rates;
    if (this.projectCounter != null) {
      data['projectCounter'] = this.projectCounter.toJson();
    }
    if (this.bidsCounter != null) {
      data['bidsCounter'] = this.bidsCounter.toJson();
    }
    if (this.projectNumber != null) {
      data['projectNumber'] = this.projectNumber.toJson();
    }
    data['avatar'] = this.avatar;
    data['register'] = this.register;
    data['statistics'] = this.statistics;
    data['mobile'] = this.mobile;
    data['verified'] = this.verified;
    data['setting'] = this.setting;
    data['workshop_name'] = this.workshopName;

    // if (this.location != null) {
    //   data['location'] = this.location.toJson();
    // }
    data['notification_settings'] = this.notificationSettings;
    return data;
  }
}

class ProjectCounter {
  int percent;
  int counter;

  ProjectCounter({this.percent, this.counter});

  ProjectCounter.fromJson(Map<String, dynamic> json) {
    percent = json['percent'];
    counter = json['counter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['percent'] = this.percent;
    data['counter'] = this.counter;
    return data;
  }
}

class Location {
  int id;
  Null address;
  String lat;
  String long;
  int userId;
  Null state;
  String createdAt;
  String updatedAt;

  Location(
      {this.id,
        this.address,
        this.lat,
        this.long,
        this.userId,
        this.state,
        this.createdAt,
        this.updatedAt});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    lat = json['lat'];
    long = json['long'];
    userId = json['user_id'];
    state = json['state'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['user_id'] = this.userId;
    data['state'] = this.state;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

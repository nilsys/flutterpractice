class SignInSocial {
  User user;
  String token;
  String lang;
  String deviceToken;

  SignInSocial({this.user, this.token, this.lang, this.deviceToken});

  SignInSocial.fromJson(Map<String, dynamic> json) {
    if(json['user'] != null){
      user = User.fromJson(json['user']);
    }
    token = json['token'];
    lang = json['lang'];
    deviceToken = json['device_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['token'] = this.token;
    data['lang'] = this.lang;
    data['device_token'] = this.deviceToken;
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
  String endTime;
  String startDate;
  String endDate;
  String commercialReg;
  List<Null> skills;
  List<Null> categories;
  int rates;
  int projectCounter;
  ProjectCounter bidsCounter;
  int projectNumber;
  String avatar;
  Null register;
  Null statistics;
  String mobile;
  int verified;
  Null setting;
  String workshopName;
  List<Null> comments;
  String location;
  String notificationSettings;

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
        this.skills,
        this.categories,
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
        this.comments,
        this.location,
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
    // if (json['skills'] != null) {
    //   skills = new List<Null>();
    //   json['skills'].forEach((v) {
    //     skills.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['categories'] != null) {
    //   categories = new List<Null>();
    //   json['categories'].forEach((v) {
    //     categories.add(new Null.fromJson(v));
    //   });
    // }
    rates = json['rates'];
    projectCounter= json['projectCounter'];
    bidsCounter = json['bidsCounter'] != null
        ? new ProjectCounter.fromJson(json['bidsCounter'])
        : null;
    projectNumber = json['projectNumber'];
    avatar = json['avatar'];
    register = json['register'];
    statistics = json['statistics'];
    mobile = json['mobile'];
    verified = json['verified'];
    setting = json['setting'];
    workshopName = json['workshop_name'];
    // if (json['comments'] != null) {
    //   comments = new List<Null>();
    //   json['comments'].forEach((v) {
    //     comments.add(new Null.fromJson(v));
    //   });
    // }
    location = json['location'];
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
    // if (this.skills != null) {
    //   data['skills'] = this.skills.map((v) => v.toJson()).toList();
    // }
    // if (this.categories != null) {
    //   data['categories'] = this.categories.map((v) => v.toJson()).toList();
    // }
    data['rates'] = this.rates;
    if (this.projectCounter != null) {
      data['projectCounter'] = this.projectCounter;
    }
    if (this.bidsCounter != null) {
      data['bidsCounter'] = this.bidsCounter.toJson();
    }
    if (this.projectNumber != null) {
      data['projectNumber'] = this.projectNumber;
    }
    data['avatar'] = this.avatar;
    data['register'] = this.register;
    data['statistics'] = this.statistics;
    data['mobile'] = this.mobile;
    data['verified'] = this.verified;
    data['setting'] = this.setting;
    data['workshop_name'] = this.workshopName;
    // if (this.comments != null) {
    //   data['comments'] = this.comments.map((v) => v.toJson()).toList();
    // }
    data['location'] = this.location;
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

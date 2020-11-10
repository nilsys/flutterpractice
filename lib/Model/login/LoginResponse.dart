class LoginResponse {
  User user;
  String token;
  String lang;
  String deviceToken;

  LoginResponse({this.user, this.token, this.lang, this.deviceToken});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
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
  String description;
  String email;
  String type;
  String startTime;
  String endTime;
  String startDate;
  String endDate;
  String commercialReg;
  List<Skills> skills;
  List<Categories> categories;
  int rates;
  ProjectCounter projectCounter;
  ProjectCounter bidsCounter;
  ProjectCounter projectNumber;
  String avatar;
  String register;
  Object statistics;
  String mobile;
  int verified;
  Setting setting;
  String workshopName;
  //List<Null> comments;
  Location location;
  NotificationSettings notificationSettings;

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
   //     this.comments,
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
    if (json['skills'] != null) {
      skills = new List<Skills>();
      json['skills'].forEach((v) {
        skills.add(new Skills.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
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
    setting =
    json['setting'] != null ? new Setting.fromJson(json['setting']) : null;
    workshopName = json['workshop_name'];
    // if (json['comments'] != null) {
    //   comments = new List<Null>();
    //   json['comments'].forEach((v) {
    //     comments.add(new Null.fromJson(v));
    //   });
    // }
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    notificationSettings = json['notification_settings'] != null
        ? new NotificationSettings.fromJson(json['notification_settings'])
        : null;
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
    if (this.skills != null) {
      data['skills'] = this.skills.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
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
    if (this.setting != null) {
      data['setting'] = this.setting.toJson();
    }
    data['workshop_name'] = this.workshopName;
    // if (this.comments != null) {
    //   data['comments'] = this.comments.map((v) => v.toJson()).toList();
    // }
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.notificationSettings != null) {
      data['notification_settings'] = this.notificationSettings.toJson();
    }
    return data;
  }
}

class Skills {
  int id;
  String name;
  String icon;

  Skills({this.id, this.name, this.icon});

  Skills.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    return data;
  }
}

class Categories {
  int id;
  String name;
  Null icon;
  Null iconColor;
  List<Skills> skills;
  String imageIcon;

  Categories(
      {this.id,
        this.name,
        this.icon,
        this.iconColor,
        this.skills,
        this.imageIcon});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    iconColor = json['iconColor'];
    if (json['skills'] != null) {
      skills = new List<Skills>();
      json['skills'].forEach((v) {
        skills.add(new Skills.fromJson(v));
      });
    }
    imageIcon = json['imageIcon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['iconColor'] = this.iconColor;
    if (this.skills != null) {
      data['skills'] = this.skills.map((v) => v.toJson()).toList();
    }
    data['imageIcon'] = this.imageIcon;
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

class Setting {
  int id;
  String profile;
  Null backprofile;
  int userId;
  bool sound;
  bool vibration;

  Setting(
      {this.id,
        this.profile,
        this.backprofile,
        this.userId,
        this.sound,
        this.vibration});

  Setting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profile = json['profile'];
    backprofile = json['backprofile'];
    userId = json['user_id'];
    sound = json['sound'];
    vibration = json['vibration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['profile'] = this.profile;
    data['backprofile'] = this.backprofile;
    data['user_id'] = this.userId;
    data['sound'] = this.sound;
    data['vibration'] = this.vibration;
    return data;
  }
}

class Location {
  int id;
  String address;
  String lat;
  String long;
  int userId;
  String state;
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

class NotificationSettings {
  bool vibration;
  bool sound;

  NotificationSettings({this.vibration, this.sound});

  NotificationSettings.fromJson(Map<String, dynamic> json) {
    vibration = json['vibration'];
    sound = json['sound'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vibration'] = this.vibration;
    data['sound'] = this.sound;
    return data;
  }
}


class ErrorLoginResponse {
  String message;
  Errors errors;

  ErrorLoginResponse({this.message, this.errors});

  ErrorLoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errors =
    json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors.toJson();
    }
    return data;
  }
}

class Errors {
  List<String> errors;

  Errors({this.errors});

  Errors.fromJson(Map<String, dynamic> json) {
    errors = json['errors'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this.errors;
    return data;
  }
}
import 'package:flutter/cupertino.dart';

class HomeResponse {
  List<Data> data;
  Links links;
  Meta meta;

  HomeResponse({this.data, this.links, this.meta});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    return data;
  }
}

class Data {
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
  dynamic  rates;
  ProjectCounter projectCounter;
  ProjectCounter bidsCounter;
  ProjectCounter projectNumber;
  String avatar;
  String register;
  Statistics statistics;
  String mobile;
  int verified;
  Setting setting;
  String workshopName;
 List<ObjectKey> comments;
  Location location;
  NotificationSettings notificationSettings;

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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
    statistics = json['statistics'] != null
        ? new Statistics.fromJson(json['statistics'])
        : null;
    mobile = json['mobile'];
    verified = json['verified'];
    setting =
    json['setting'] != null ? new Setting.fromJson(json['setting']) : null;
    workshopName = json['workshop_name'];
    // if (json['comments'] != null) {
    //   comments = new List<ObjectKey>();
    //   json['comments'].forEach((v) {
    //     comments.add(new ObjectKey.fromJson(v));
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
    if (this.statistics != null) {
      data['statistics'] = this.statistics.toJson();
    }
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

class Statistics {
  String onbudget;
  String ontime;
  String hireagin;

  Statistics({this.onbudget, this.ontime, this.hireagin});

  Statistics.fromJson(Map<String, dynamic> json) {
    onbudget = json['onbudget'];
    ontime = json['ontime'];
    hireagin = json['hireagin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['onbudget'] = this.onbudget;
    data['ontime'] = this.ontime;
    data['hireagin'] = this.hireagin;
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

class Links {
  String first;
  Null last;
  Null prev;
  String next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  int currentPage;
  int from;
  String path;
  int perPage;
  int to;

  Meta({this.currentPage, this.from, this.path, this.perPage, this.to});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    return data;
  }
}

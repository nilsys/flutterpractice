class ProfileModel{

  String name;
  String email;
  String phone;
  String locationName;
  String image;

  ProfileModel(this.name, this.email, this.phone, this.locationName,this.image);


  set userName(String Name){
    name=Name;
  }
  String get userName{
    return name;
  }

  set userEmail(String Email){
    email = Email;
  }

  String get userEmail{
    return email;
  }

  set userPhone(String phon){
   phone=phon;
  }

  String get userPhone{
    return phone;
  }

  set userLocation(String loc){
   locationName=loc;
  }
  String get userLocation{
    return locationName;
  }

  void set userImage(String img){
    image=img;
  }
  String get userImage{
    return image;
  }
}
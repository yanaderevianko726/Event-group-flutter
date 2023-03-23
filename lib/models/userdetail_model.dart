
class UserDetail {
  String? userId;
  String? firstName;
  String? lastName;
  String? title;
  String? email;
  String? password;
  String? mobile;
  String? image;
  String? gender;
  String? address;
  String? city;
  String? country;
  String? state;
  String? lat;
  String? long;
  String? phoneVerified;
  String? posts;
  String? followers;
  String? followings;

  UserDetail({
    this.userId = '',
    this.firstName = '',
    this.lastName = '',
    this.title = '',
    this.email = '',
    this.password = '',
    this.mobile = '',
    this.image = '',
    this.gender = '',
    this.address = '',
    this.city = '',
    this.country = '',
    this.state = '',
    this.lat = '',
    this.long = '',
    this.phoneVerified = 'Not',
    this.posts = '0',
    this.followers = '0',
    this.followings = '0',
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
    userId: json["userId"] ?? '',
    firstName: json["firstName"] ?? '',
    lastName: json["lastName"] ?? '',
    title: json["title"] ?? '',
    email: json["email"] ?? '',
    password: json["password"] ?? '',
    mobile: json["mobile"] ?? '',
    image: json["image"],
    gender: json["gender"] ?? '',
    address: json["address"] ?? '',
    city: json["city"] ?? '',
    country: json["country"] ?? '',
    state: json["state"] ?? '',
    lat: json["lat"] ?? '',
    long: json["long"] ?? '',
    phoneVerified: json["phoneVerified"] ?? '',
    posts: json["posts"] ?? '0',
    followers: json["followers"] ?? '0',
    followings: json["followings"] ?? '0',
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "firstName": firstName,
    "lastName": lastName,
    "title": title,
    "email": email,
    "password": password,
    "mobile": mobile,
    "image": image,
    "gender": gender,
    "address": address,
    "city": city,
    "country": country,
    "state": state,
    "lat": lat,
    "long": long,
    "phoneVerified": phoneVerified,
    "posts": posts,
    "followers": followers,
    "followings": followings,
  };
}


class JobSeekerModel {
  final String id;
  final String locationType;
  final double longitude;
  final double latitude;
  final String state;
  final String country;
  final String formattedAddress;
  final List<String> languages;
  final List<String> cvs;
  final String name;
  final String dateOfBirth;
  final String gendar;
  final String bio;
  final String email;
  final String skills;
  final String profileImage;
  final String userRole;
  final bool userIsVerified;
  final String userPhone;
  final String userCreatedAt;
  final int userV;
  final String userId;
  final String userEmail;
  final String createdAt;
  final String slug;
  final int v;
  final List applications;
  final List alerts;
  final String idID;

  JobSeekerModel({
    required this.id,
    required this.locationType,
    required this.longitude,
    required this.latitude,
    required this.state,
    required this.country,
    required this.formattedAddress,
    required this.languages,
    required this.cvs,
    required this.name,
    required this.dateOfBirth,
    required this.gendar,
    required this.bio,
    required this.email,
    required this.skills,
    required this.profileImage,
    required this.userRole,
    required this.userIsVerified,
    required this.userPhone,
    required this.userCreatedAt,
    required this.userV,
    required this.userId,
    required this.userEmail,
    required this.createdAt,
    required this.slug,
    required this.v,
    required this.applications,
    required this.alerts,
    required this.idID,
  });
  factory JobSeekerModel.fromJson(Map<String, dynamic> json) {
    return JobSeekerModel(
      id: json['_id'],
      locationType: json['location']['type'],
      longitude: json['location']['coordinates'][0],
      latitude: json['location']['coordinates'][1],
      formattedAddress: json['location']['formattedAddress'],
      state: json['location']['state'],
      country: json['location']['country'],
      languages: List<String>.from(
        json['languages'].map((e) => e),
      ),
      cvs: List<String>.from(
        json['CVs'].map((e) => e),
      ),
      name: json['name'],
      dateOfBirth: json['dateOfBirth'],
      gendar: json['gendar'],
      bio: json['bio'],
      email: json['email'] ?? '',
      skills: json['skills'],
      profileImage: json['profileImage'],
      userRole: json['user']['role'],
      userIsVerified: json['user']['isVerified'],
      userPhone: json['user']['phone'],
      userCreatedAt: json['user']['createdAt'],
      userV: json['user']['__v'],
      userId: json['user']['_id'],
      userEmail: json['user']['email'],
      createdAt: json['createdAt'],
      slug: json['slug'],
      v: json['__v'],
      applications: json['applications'],
      alerts: json['alerts'],
      idID: json['id'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "location": {
        "type": locationType,
        "coordinates": [longitude, latitude],
        "formattedAddress": formattedAddress,
        "state": state,
        "country": country
      },
      "languages": languages,
      "CVs": cvs,
      "_id": id,
      "name": name,
      "dateOfBirth": dateOfBirth,
      "gendar": gendar,
      "bio": bio,
      "email": email,
      "skills": skills,
      "profileImage": profileImage,
      "user": {
        "role": userRole,
        "isVerified": userIsVerified,
        "_id": userId,
        "phone": userPhone,
        "createdAt": userCreatedAt,
        "__v": userV,
        "email": userEmail
      },
      "createdAt": createdAt,
      "slug": slug,
      "__v": 0,
      "applications": applications,
      "alerts": alerts,
      "id": idID
    };
  }
}

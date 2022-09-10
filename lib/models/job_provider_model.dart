import 'job_provider_job_model.dart';

class JobProviderModel {
  final String id;
  final String location;
  final String name;
  final String fields;
  final String dateOfStartup;
  final String bio;
  final String email;
  final String companyDescription;
  final String profileImage;
  final String address;
  final String role;
  final String userID;
  final String phone;
  final String createdAt;
  final String userCreatedAt;
  final String slug;
  final String idID;
  final int userV;
  final int v;
  final bool userIsVerified;
  final bool isApproved;
  final List<JobProviderJobModel> jobs;

  JobProviderModel({
    required this.userID,
    required this.phone,
    required this.createdAt,
    required this.userCreatedAt,
    required this.slug,
    required this.idID,
    required this.userV,
    required this.v,
    required this.userIsVerified,
    required this.id,
    required this.location,
    required this.name,
    required this.fields,
    required this.dateOfStartup,
    required this.bio,
    required this.email,
    required this.companyDescription,
    required this.profileImage,
    required this.address,
    required this.role,
    required this.isApproved,
    required this.jobs,
  });
  factory JobProviderModel.fromJson(Map<String, dynamic> json) {
    return JobProviderModel(
      address: json['address'],
      location: json['location']['formattedAddress'],
      id: json['_id'],
      name: json['name'],
      bio: json['bio'],
      companyDescription: json['companyDescription'],
      role: json['user']['role'],
      fields: json['fields'],
      dateOfStartup: json['dateOfStartup'],
      email: json['email'],
      isApproved: json['isApproved'],
      userID: json['user']['_id'],
      userCreatedAt: json['user']['createdAt'],
      userIsVerified: json['user']['isVerified'],
      userV: json['user']['__v'],
      jobs: List<JobProviderJobModel>.from(
        json["jobs"].map((x) => JobProviderJobModel.fromJson(x)),
      ),
      profileImage: json['profileImage'],
      v: json['__v'],
      createdAt: json['createdAt'],
      idID: json['id'],
      phone: json['user']['phone'],
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "location": {"formattedAddress": location},
      "_id": id,
      "fields": fields,
      "name": name,
      "dateOfStartup": dateOfStartup,
      "bio": bio,
      "email": email,
      "companyDescription": companyDescription,
      "profileImage": profileImage,
      "address": address,
      "user": {
        "role": role,
        "isVerified": userIsVerified,
        "_id": userID,
        "phone": phone,
        "createdAt": userCreatedAt,
        "__v": userV,
        "email": email
      },
      "createdAt": createdAt,
      "slug": slug,
      "__v": v,
      "isApproved": isApproved,
      "jobs": List.from(jobs.map((e) => JobProviderJobModel(
            createdAt: e.createdAt,
            v: e.v,
            state: e.state,
            salary: e.salary,
            longitude: e.longitude,
            locationType: e.locationType,
            latitude: e.latitude,
            jobType: e.jobType,
            jobProviderID: e.jobProviderID,
            jobDescription: e.jobDescription,
            isDone: e.isDone,
            id: e.id,
            formattedAddress: e.formattedAddress,
            deadline: e.deadline,
            country: e.country,
            jobQualifications: e.jobQualifications,
            name: e.name,
          ).toJson())),
      "id": idID
    };
  }
}

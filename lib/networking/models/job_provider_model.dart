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
  final bool isApproved;
  final List<JobProviderJobModel> jobs;

  JobProviderModel({
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
      //jobs: json['jobs'].map((e) => JobProviderJobModel.fromJson(e)).toList(),
      jobs: List<JobProviderJobModel>.from(
          json["jobs"].map((x) => JobProviderJobModel.fromJson(x))),
      profileImage: json['profileImage'],
    );
  }
}

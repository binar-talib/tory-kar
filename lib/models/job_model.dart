class JobModel {
  final String locationType;
  final double longitude;
  final double latitude;
  final String formattedAddress;
  final String state;
  final String country;
  final String jobType;
  final String name;
  final String id;
  final String deadline;
  final String jobDescription;
  final String jobQualifications;
  final String jobProviderID;
  final String jobProviderName;
  final String jobProviderIDID;
  final String createdAt;
  final bool isDone;
  final int salary;
  final int v;

  JobModel({
    required this.locationType,
    required this.longitude,
    required this.latitude,
    required this.formattedAddress,
    required this.state,
    required this.country,
    required this.jobType,
    required this.isDone,
    required this.id,
    required this.name,
    required this.deadline,
    required this.jobDescription,
    required this.jobQualifications,
    required this.salary,
    required this.jobProviderID,
    required this.jobProviderName,
    required this.jobProviderIDID,
    required this.createdAt,
    required this.v,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      locationType: json['location']['type'],
      longitude: json['location']['coordinates'][0],
      latitude: json['location']['coordinates'][1],
      formattedAddress: json['location']['formattedAddress'],
      state: json['location']['state'],
      country: json['location']['country'],
      jobType: json['jobType'],
      isDone: json['isDone'],
      id: json['_id'],
      name: json['name'],
      deadline: json['deadline'],
      jobDescription: json['jobDescription'],
      jobQualifications: json['jobQualifications'],
      salary: json['salary'],
      jobProviderID: json['jobProvider']['_id'],
      jobProviderIDID: json['jobProvider']['id'],
      jobProviderName: json['jobProvider']['name'],
      createdAt: json['createdAt'],
      v: json['__v'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "location": {
        "type": locationType,
        "coordinates": [latitude, longitude],
        "formattedAddress": formattedAddress,
        "state": state,
        "country": country
      },
      "jobType": jobType,
      "isDone": isDone,
      "_id": id,
      "name": name,
      "deadline": deadline,
      "jobDescription": jobDescription,
      "jobQualifications": jobQualifications,
      "salary": salary,
      "jobProvider": {
        "_id": jobProviderID,
        "name": jobProviderName,
        "id": jobProviderIDID,
      },
      "createdAt": createdAt,
      "__v": v,
    };
  }
}

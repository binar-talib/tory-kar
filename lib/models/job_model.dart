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
  final int salary;
  final bool isDone;

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
      jobProviderName: json['jobProvider']['name'],
    );
  }
  JobModel copyWith({
    required String locationType,
    required double longitude,
    required double latitude,
    required String formattedAddress,
    required String state,
    required String country,
    required String jobType,
    required String id,
    required String name,
    required String deadline,
    required String jobDescription,
    required String jobQualifications,
    required String jobProviderID,
    required String jobProviderName,
    required int salary,
    required bool isDone,
  }) =>
      JobModel(
        country: country,
        deadline: deadline,
        formattedAddress: formattedAddress,
        id: id,
        isDone: isDone,
        jobDescription: jobDescription,
        jobProviderID: jobProviderID,
        jobProviderName: jobProviderName,
        name: name,
        jobQualifications: jobQualifications,
        jobType: jobType,
        latitude: latitude,
        locationType: locationType,
        longitude: latitude,
        salary: salary,
        state: state,
      );
}

class Job {
  final String locationType;
  final double longitude;
  final double latitude;
  final String formattedAddress;
  final String state;
  final String country;
  final String jobType;
  final bool isDone;
  final String id;
  final String name;
  final String deadline;
  final String jobDescription;
  final String jobQualifications;
  final int salary;
  final String jobProviderID;
  final String jobProviderName;

  Job({
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

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
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
}

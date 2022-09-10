class AddEditJobModel {
  final String name;
  final String jobDescription;
  final String jobQualifications;
  final String deadline;
  final int salary;
  final String jobType;

  AddEditJobModel({
    required this.name,
    required this.jobDescription,
    required this.jobQualifications,
    required this.deadline,
    required this.salary,
    required this.jobType,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "jobDescription": jobDescription,
      "jobQualifications": jobQualifications,
      "deadline": deadline,
      "salary": salary,
      "jobType": jobType
    };
  }
}

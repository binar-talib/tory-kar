import 'package:tory_kar/networking/job_provider.dart';

class CreateNewJobProviderModel {
  Map<String, dynamic> toJson() {
    return {
      "name": JobProvider.name,
      "dateOfStartup": JobProvider.dateOfStartup,
      "fields": JobProvider.field,
      "bio": JobProvider.bio,
      "email": JobProvider.email,
      "companyDescription": JobProvider.companyDescription,
      "profileImage": "no-image.jpg",
      "address": "Erbil"
    };
  }
}

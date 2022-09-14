import '../networking/authentication.dart';

class CreateNewJobSeekerModel {
  Map<String, dynamic> toJson() {
    return {
      "name": Authentication.fullName,
      "dateOfBirth": Authentication.dateOfBirth,
      "gendar": Authentication.gendar.toLowerCase(),
      "bio": Authentication.bio,
      "email": Authentication.email,
      "skills": Authentication.skills,
      "languages": Authentication.selectedLanguages,
      "profileImage": "no-image.jpg",
      "CVs": ["cv1.pdf", "cv2.pdf"],
      "address": "Erbil"
    };
  }
}

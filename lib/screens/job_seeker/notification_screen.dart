import 'package:flutter/material.dart';
import 'package:tory_kar/custom_widgets/custom_app_bar.dart';
import 'package:tory_kar/custom_widgets/waiting_card.dart';
import 'package:tory_kar/modules/some_data.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // List<dynamic> allNotifications = [];
  //
  // @override
  // void initState() {
  //   super.initState();
  //   getAllJobs();
  // }
  //
  // Future<void> getAllJobs() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   print(prefs.getString('token'));
  //   print(prefs.getString('_id'));
  //   http.Response response = await http.get(
  //     Uri.parse(
  //       'https://tory-kar-1.herokuapp.com/api/v1/jobseekers/${prefs.getString('_id')}/notifications',
  //     ),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Authorization': 'Bearer ${prefs.getString('token')}',
  //     },
  //   );
  //   if (response.statusCode == 200) {
  //     var decodedJson = convert.jsonDecode(response.body);
  //     setState(() {
  //       allNotifications = decodedJson['data'];
  //     });
  //   } else {
  //     print(response.statusCode);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Notifications',
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          return WaitingCard(
            screen: 'notification',
            image: jobs[index]['image'],
            title: jobs[index]['title'],
            company: jobs[index]['company'],
            date: jobs[index]['deadline'],
          );
        },
      ),
    );
  }
}

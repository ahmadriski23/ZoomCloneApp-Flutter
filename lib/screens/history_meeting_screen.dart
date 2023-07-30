import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoom_clone_app/resources/firestore_methods.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethods().meetingHistory,
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
            itemCount: (snapshot.data! as dynamic).docs.length,
            itemBuilder: (context, index) => ListTile(
                title: FlipInY(
                  delay: Duration(milliseconds: 500),
                  child: Text(
                    'Room Name : ${(snapshot.data! as dynamic).docs[index]['meetingName']}',
                  ),
                ),
                subtitle: ZoomIn(
                  delay: Duration(milliseconds: 800),
                  child: Text(
                      'Joined on ${DateFormat.yMMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}'),
                )));
      }),
    );
  }
}

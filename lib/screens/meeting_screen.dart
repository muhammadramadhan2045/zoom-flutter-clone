import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zum_clone/resources/meet_methods.dart';
import 'package:zum_clone/widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});
  final MeetMehods _meetMethods = MeetMehods();
  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _meetMethods.createNewMeeting(
      roomName: roomName,
      isAudiMuted: true,
      isVideoMuted: true,
    );
  }

  joinMeeting(BuildContext context) {
    Navigator.of(context).pushNamed('/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onpressed: createNewMeeting,
              text: 'New Meeting',
              icon: Icons.videocam,
            ),
            HomeMeetingButton(
              onpressed: () {
                Navigator.of(context).pushNamed('/video-call');
              },
              text: 'Join Meeting',
              icon: Icons.add_box_rounded,
            ),
            HomeMeetingButton(
              onpressed: () {},
              text: 'Schedule',
              icon: Icons.calendar_today,
            ),
            HomeMeetingButton(
              onpressed: () {},
              text: 'Share Screen',
              icon: Icons.arrow_upward,
            ),
          ],
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Create/ Join Meeting',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        )
      ],
    );
  }
}

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:zum_clone/screens/histori_meeting_screen.dart';
import 'package:zum_clone/screens/meeting_screen.dart';
import 'package:zum_clone/utils/colors.dart';
import 'package:zum_clone/widgets/home_meeting_button.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List<Widget> pages = [
    MeetingScreen(),
    const HistoriMeetingScreen(),
    MeetingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: const Text(
          'Meet & Chat',
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: const <Widget>[
          Icon(
            Icons.comment_bank,
            semanticLabel: 'Meet & Char',
          ),
          Icon(
            Icons.lock_clock,
            semanticLabel: 'Meetings',
          ),
          Icon(
            Icons.person_outline,
            semanticLabel: 'Contact',
          ),
          Icon(
            Icons.settings_outlined,
            semanticLabel: 'Setting',
          ),
        ],
        color: footerColor,
        buttonBackgroundColor: footerColor,
        backgroundColor: footerColor.withOpacity(0.1),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: pages[_page],
    );
  }
}

class HistoryMeeting extends StatelessWidget {
  const HistoryMeeting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onpressed: () {},
              text: 'New Meeting',
              icon: Icons.videocam,
            ),
            HomeMeetingButton(
              onpressed: () {},
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

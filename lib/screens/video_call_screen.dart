import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone_app/resources/auth_methods.dart';
import 'package:zoom_clone_app/resources/jitsi_meet_methods.dart';
import 'package:zoom_clone_app/utils/colors.dart';
import 'package:zoom_clone_app/widgets/meeting_options.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController meetingIdController;

  late TextEditingController nameController;
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  bool isAudioMuted = true;
  bool isVideoMuted = true;

  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(text: _authMethods.user.displayName);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
  }

  _joinMeeting() {
    _jitsiMeetMethods.createMeeting(
      roomName: meetingIdController.text,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
      username: nameController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: FadeIn(
          duration: const Duration(milliseconds: 350),
          child: const Text(
            'Join a Meeting',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 60,
            child: FlipInX(
              duration: const Duration(milliseconds: 850),
              child: TextField(
                controller: meetingIdController,
                maxLines: 1,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    fillColor: secondaryBackgroundColor,
                    filled: true,
                    border: InputBorder.none,
                    hintText: 'Room ID',
                    contentPadding: EdgeInsets.fromLTRB(
                      16,
                      8,
                      0,
                      0,
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: FlipInX(
              duration: const Duration(milliseconds: 1350),
              child: TextField(
                controller: nameController,
                maxLines: 1,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    fillColor: secondaryBackgroundColor,
                    filled: true,
                    border: InputBorder.none,
                    hintText: 'Name',
                    contentPadding: EdgeInsets.fromLTRB(
                      16,
                      8,
                      0,
                      0,
                    )),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: _joinMeeting,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: FlipInX(
                duration: const Duration(milliseconds: 1750),
                child: const Text(
                  'Join',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FlipInX(
            duration: const Duration(milliseconds: 2350),
            child: MeetingOption(
              text: 'Mute Audio',
              isMute: isAudioMuted,
              onChange: onAudioMuted,
            ),
          ),
          FlipInX(
            duration: const Duration(milliseconds: 2350),
            child: MeetingOption(
              text: 'Turn off My Video',
              isMute: isVideoMuted,
              onChange: onVideoMuted,
            ),
          )
        ],
      ),
    );
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}

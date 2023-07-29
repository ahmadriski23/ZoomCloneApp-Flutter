import 'package:omni_jitsi_meet/feature_flag/feature_flag.dart'
    show FeatureFlag;
import 'package:omni_jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone_app/resources/auth_methods.dart';
import 'package:zoom_clone_app/resources/firestore_methods.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();
  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION;
      String name;

      if (username.isEmpty) {
        name = _authMethods.user.displayName!;
      } else {
        name = username;
      }
      var options = JitsiMeetingOptions(
        room: roomName,
        userDisplayName: name,
        userEmail: _authMethods.user.email,
        userAvatarURL: _authMethods.user.photoURL,
        audioMuted: isAudioMuted,
        videoMuted: isVideoMuted,
      );

      _firestoreMethods.addToMeetingHistory(roomName);
      await JitsiMeet.joinMeeting(options, listener: JitsiMeetingListener());
    } catch (error) {
      print("error: $error");
    }
  }
}

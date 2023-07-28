import 'package:omni_jitsi_meet/feature_flag/feature_flag.dart'
    show FeatureFlag;
import 'package:omni_jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone_app/resources/auth_methods.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();
  void createMeeting(
      {required String roomName,
      required bool isAudioMuted,
      required bool isVideoMuted}) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION;

      var options = JitsiMeetingOptions(
        room: roomName,
        userDisplayName: _authMethods.user.displayName,
        userEmail: _authMethods.user.email,
        userAvatarURL: _authMethods.user.photoURL,
        audioMuted: isAudioMuted,
        videoMuted: isVideoMuted,
      );
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
  }
}

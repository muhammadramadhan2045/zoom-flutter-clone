import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:zum_clone/resources/auth_method.dart';

class MeetMehods {
  final AuthMethod _authMethod = AuthMethod();
  void createNewMeeting({
    required String roomName,
    required bool isAudiMuted,
    required bool isVideoMuted,
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p

      var options = JitsiMeetingOptions(
        room: roomName,
      )
        ..userDisplayName = _authMethod.user.displayName
        ..userEmail = _authMethod.user.email
        ..userAvatarURL = _authMethod.user.photoURL // or .png
        ..audioMuted = isAudiMuted
        ..videoMuted = isVideoMuted;

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
  }
}

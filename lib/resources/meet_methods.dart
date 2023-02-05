import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:zum_clone/resources/auth_method.dart';
import 'package:zum_clone/resources/firebase_method.dart';

class MeetMehods {
  final AuthMethod _authMethod = AuthMethod();
  final FirestoreMethod _firestoreMethod = FirestoreMethod();
  void createNewMeeting({
    required String roomName,
    required bool isAudiMuted,
    required bool isVideoMuted,
    String username = '',
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p

      String name;
      if (username.isEmpty) {
        name = _authMethod.user.displayName!;
      } else {
        name = username;
      }

      var options = JitsiMeetingOptions(
        room: roomName,
      )
        ..userDisplayName = name
        ..userEmail = _authMethod.user.email
        ..userAvatarURL = _authMethod.user.photoURL // or .png
        ..audioMuted = isAudiMuted
        ..videoMuted = isVideoMuted;

      _firestoreMethod.addToMeetingHistory(roomName);
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
  }
}

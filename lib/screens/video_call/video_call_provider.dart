import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meeting_listener.dart';
import 'package:virtudoc_app/index.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class VideoCallProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isCalling = false;
  Future initiateCall({String meetLink, int appointmentId}) async {
    isLoading = true;
    notifyListeners();
    await ApiRequest.postApi(ApiUrl.videocall,
        {'appointment_id': '$appointmentId', 'meet_link': meetLink});

    isLoading = false;
    notifyListeners();
  }

  videoCallPage({
    String link,
    String doctorName = "",
    String doctorImage,
  }) async {
    PreferenceUtils.putBool(PreferenceKeys.IS_CALLING, true);

    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p
      var options = JitsiMeetingOptions()
        ..room = link
        ..serverURL = ApiUrl.jitsiServerUrl
        ..userDisplayName = doctorName
        ..userAvatarURL = doctorImage == null || doctorImage.isEmpty
            ? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
            : doctorImage // or .png
        ..audioOnly = true
        ..audioMuted = true
        ..videoMuted = true
        ..featureFlag = featureFlag;
      await JitsiMeet.addListener(
          JitsiMeetingListener(onConferenceTerminated: someMethod));
      await JitsiMeet.joinMeeting(options);
    } catch (error) {

    }
  }

  someMethod({Map message}) {
    PreferenceUtils.putBool(PreferenceKeys.IS_CALLING, false);
  }
}

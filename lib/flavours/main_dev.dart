import 'package:virtudoc_app/apimanager/api_url.dart';
import 'package:virtudoc_app/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.getInstance();
  var configuredApp = new AppConfig(
    child: VirtuDocApp(),
  );
  ApiUrl.baseUrl = ApiUrl.baseTestDev;
  runApp(configuredApp);
}

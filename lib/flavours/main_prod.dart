import 'package:virtudoc_app/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.getInstance();
  var configuredApp = new AppConfig(
    child: VirtuDocApp(),
  );

  runApp(configuredApp);
}

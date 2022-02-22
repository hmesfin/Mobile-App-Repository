import 'package:virtudoc_app/index.dart';

class AppConfig extends InheritedWidget {
  AppConfig({
    this.flavorName,
    this.apiBaseUrl,
    @required Widget child,
  }) : super(child: child);

  final String flavorName;
  final String apiBaseUrl;

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: AppConfig);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

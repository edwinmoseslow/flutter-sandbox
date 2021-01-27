import 'package:flutter/cupertino.dart';
import 'package:flutter_app/routes/route_path.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);

    if (uri.pathSegments.isNotEmpty && uri.pathSegments.first == 'settings') {
      return SettingPath();
    } else {
      // if (uri.pathSegments.length >= 2) {
      //   if (uri.pathSegments[0] == 'book') {
      //     return BooksDetailsPath(int.tryParse(uri.pathSegments[1]));
      //   }
      // }

      return DashboardPath();
    }
  }

  @override
  RouteInformation restoreRouteInformation(AppRoutePath configuration) {
    // if (configuration is BooksListPath) {
    //   return RouteInformation(location: '/home');
    // }
    // if (configuration is BooksSettingsPath) {
    //   return RouteInformation(location: '/settings');
    // }
    // if (configuration is BooksDetailsPath) {
    //   return RouteInformation(location: '/book/${configuration.id}');
    // }
    return null;
  }
}

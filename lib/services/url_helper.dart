/* 
Handles the urls that will be launched from the app
*/
/*-- Packages Import--*/
import 'package:url_launcher/url_launcher.dart';

String url;
//In App Browser
void launchURL(String url) async {
  await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}

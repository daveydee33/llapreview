import 'package:llapreview/about/about.dart';
import 'package:llapreview/profile/profile.dart';
import 'package:llapreview/login/login.dart';
import 'package:llapreview/topics/topics.dart';
import 'package:llapreview/home/home.dart';

var appRoutes = {
  '/': (context) => const Home(),
  '/login': (context) => const Login(),
  '/topics': (context) => const Topics(),
  '/profile': (context) => const ProfileScreen(),
  '/about': (context) => const About(),
};

import 'package:llapreview/collections/collections.dart';
import 'package:llapreview/profile/profile.dart';
import 'package:llapreview/login/login.dart';
import 'package:llapreview/topics/topics.dart';
import 'package:llapreview/home/home.dart';
import 'package:llapreview/words/words.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/topics': (context) => const TopicsScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/collections': (context) => const CollectionsScreen(),
  '/words': (context) => const WordsScreen(),
};

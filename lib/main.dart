import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:llapreview/routes.dart';
import 'package:llapreview/services/services.dart';
import 'package:llapreview/shared/shared.dart';
import 'package:llapreview/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: App(),
    ),
  );
}

/// We are using a StatefulWidget such that we only create the [Future] once,
/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [App] is rebuilt, that
/// would re-initialize FlutterFire and make our application re-enter loading state,
/// which is undesired.
class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print('ERROR....');
          return Center(
            child: ErrorMessage(message: snapshot.error.toString()),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider(
            create: (_) => FirestoreService().streamReport(),
            catchError: (_, err) => Report(),
            initialData: Report(),
            child: MaterialApp(
              routes: appRoutes,
              theme: appTheme,
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const MaterialApp(home: LoadingScreen());
      },
    );
  }
}

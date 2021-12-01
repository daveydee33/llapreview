import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:llapreview/quiz/quiz_state.dart';
import 'package:llapreview/services/firestore.dart';
import 'package:llapreview/services/models.dart';
import 'package:llapreview/shared/shared.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key, required this.quizId}) : super(key: key);
  final String quizId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuizState(),
      child: FutureBuilder<Quiz>(
        future: FirestoreService().getQuiz(quizId),
        builder: (context, snapshot) {
          var state = Provider.of<QuizState>(context);

          if (!snapshot.hasData || snapshot.hasError) {
            return Loader();
          } else {
            var quiz = snapshot.data!;

            return Scaffold();
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:llapreview/services/models.dart';
import 'package:provider/provider.dart';

class AnimatedProgressbar extends StatelessWidget {
  final double value;
  final double height;

  const AnimatedProgressbar({Key? key, required this.value, this.height = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints box) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: box.maxWidth,
          child: Stack(
            children: [
              Container(
                height: height,
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(height),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOutCubic,
                height: height,
                width: box.maxWidth * _floor(value),
                decoration: BoxDecoration(
                  color: _colorGen(value),
                  borderRadius: BorderRadius.all(
                    Radius.circular(height),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Always round negative or NaNs to min value
  _floor(double value, [min = 0.0]) {
    return value.sign <= min ? min : value;
  }

  _colorGen(double value) {
    int rbg = (value * 255).toInt();
    return Colors.deepOrange.withGreen(rbg).withRed(255 - rbg);
  }
}

class TopicProgress extends StatelessWidget {
  const TopicProgress({Key? key, required this.topic}) : super(key: key);

  final Topic topic;

  @override
  Widget build(BuildContext context) {
    Report report = Provider.of<Report>(context);
    return Row(
      children: [
        _progressCount(report, topic),
        Expanded(
          child: AnimatedProgressbar(
              value: _calculateProgress(topic, report), height: 8),
        ),
      ],
    );
  }

  Widget _progressCount(Report report, Topic topic) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        '${report.topics[topic.id]?.length ?? 0} / ${topic.quizzes.length}',
        style: const TextStyle(fontSize: 10, color: Colors.grey),
      ),
    );
  }

  double _calculateProgress(Topic topic, Report report) {
    try {
      int totalQuizzes = topic.quizzes.length;
      int completedQuizzes = report.topics[topic.id].length;
      return completedQuizzes / totalQuizzes;
    } catch (err) {
      return 0.0;
    }
  }
}

class CollectionProgress extends StatelessWidget {
  const CollectionProgress({Key? key, required this.collection})
      : super(key: key);

  final Collection collection;

  @override
  Widget build(BuildContext context) {
    Report report = Provider.of<Report>(context);
    return Row(
      children: [
        _progressCount(report, collection),
        Expanded(
          child: AnimatedProgressbar(
              value: _calculateProgress(collection, report), height: 8),
        ),
      ],
    );
  }

  Widget _progressCount(Report report, Collection collection) {
    var count = 0;
    for (var item in collection.items) {
      if (report.progress.containsKey(item) && report.progress[item] == 2)
        count++;
    }

    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        '$count / ${collection.items.length}',
        style: const TextStyle(fontSize: 10, color: Colors.grey),
      ),
    );
  }

  double _calculateProgress(Collection collection, Report report) {
    var count = 0;
    for (var item in collection.items) {
      if (report.progress.containsKey(item) && report.progress[item] == 2)
        count++;
    }

    int completedItems = count;
    int totalItems = collection.items.length;
    final result = completedItems / totalItems;
    if (result.isInfinite || result.isNaN) {
      // TODO: this is probably an issue with the data that needs to be fixed.
      return 0.0;
    } else {
      return result;
    }
  }
}

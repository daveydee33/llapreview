import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:llapreview/services/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemList extends StatelessWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // state
    final items = context.watch<Counter>().items;

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, int index) {
        return Container(
          child: Column(
            children: [
              ItemCard(items[index]),
            ],
          ),
        );
      },
    );
  }
}

class ItemCard extends StatelessWidget {
  final item;

  ItemCard(this.item);

  // void playSound(String title) async {
  //   final player = AudioPlayer();
  //   await player.setAsset('assets/audio/A/${title}.mp3');
  //   player.play();
  // }

  // void playSoundMultipleWeb(String title) async {
  //   final player = AudioPlayer();
  //   // i think this method is slow because it waits for all 4 before starting to play... ?
  //   await player.setAudioSource(
  //     ConcatenatingAudioSource(
  //       useLazyPreparation: false,
  //       children: [
  //         // AudioSource.uri(Uri.parse('asset:///assets/audio/A/${title}.mp3')),
  //         AudioSource.uri(
  //             Uri.parse('https://lla-audio.s3.amazonaws.com/A/${title}.mp3')),
  //         AudioSource.uri(
  //             Uri.parse('https://lla-audio.s3.amazonaws.com/B/${title}.mp3')),
  //         AudioSource.uri(
  //             Uri.parse('https://lla-audio.s3.amazonaws.com/C/${title}.mp3')),
  //         AudioSource.uri(
  //             Uri.parse('https://lla-audio.s3.amazonaws.com/D/${title}.mp3')),
  //       ],
  //     ),
  //   );
  //   player.play();
  // }

  void playSoundMultipleAssets(String title) async {
    final player = AudioPlayer();

    try {
      ConcatenatingAudioSource audios = ConcatenatingAudioSource(children: []);
      audios.add(
          AudioSource.uri(Uri.parse('asset:///assets/audio/B/${title}.mp3')));
      audios.add(
          AudioSource.uri(Uri.parse('asset:///assets/audio/A/${title}.mp3')));
      await player.setAudioSource(audios);
    } catch (e) {
      print('ERROR adding Audio Source.');
      print(e);
    }

    player.play();
  }

  Widget itemExamples(List<dynamic> examples) {
    if (examples.isEmpty) return const Text('');
    return Column(
      children: examples
          .map(
            (ex) => ListTile(
              leading: IconButton(
                icon: const Icon(FontAwesomeIcons.solidPlayCircle),
                onPressed: () {},
              ),
              title: Text('${ex['title']}'),
              subtitle: Text('${ex['description']}'),
              horizontalTitleGap: 8,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: IconButton(
              icon: const Icon(FontAwesomeIcons.solidPlayCircle),
              tooltip: 'Play sound',
              iconSize: 50,
              onPressed: () => playSoundMultipleAssets('${item['title']}'),
            ),
            title: Text(
              '${item['title']}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            subtitle: Text(
              '${item['description']}',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 24.0,
              ),
            ),
          ),
          Container(
            // margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(15.0),
            // decoration: BoxDecoration(
            //   border: Border.all(color: Colors.grey),
            // ),
            child: Image.asset('assets/temp/temp1.jpeg', width: 300),
          ),
          Flex(
            direction: Axis.horizontal,
            children: [
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    '${item['details']}',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
          itemExamples(item[
              'examples']), // TODO: refactor this to be a separate component.  review YouTube video.  https://www.youtube.com/watch?v=IOyq-eTRhvo
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: [
              Favorite(title: '${item['title']}'),
              ProgressStatus(title: '${item['title']}'),
            ],
          ),
        ],
      ),
    );
  }
}

class Favorite extends StatelessWidget {
  final String title;

  const Favorite({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Report report = Provider.of<Report>(context);
    List favorites = report.favorites;

    if (favorites.contains(title)) {
      return IconButton(
        icon: const Icon(FontAwesomeIcons.solidStar, color: Colors.yellow),
        onPressed: () {
          FirestoreService().unsetFavorite(title);
        },
      );
    } else {
      return IconButton(
        icon: const Icon(FontAwesomeIcons.star, color: Colors.grey),
        onPressed: () {
          FirestoreService().setFavorite(title);
        },
      );
    }
  }
}

class ProgressStatus extends StatelessWidget {
  final String title;

  const ProgressStatus({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Report report = Provider.of<Report>(context);
    List completed = report.completed;

    if (completed.contains(title)) {
      return IconButton(
        icon: const Icon(FontAwesomeIcons.checkDouble, color: Colors.green),
        onPressed: () {
          FirestoreService().unsetCompleted(title);
        },
      );
    } else {
      return IconButton(
        icon: const Icon(FontAwesomeIcons.circle, color: Colors.grey),
        onPressed: () {
          FirestoreService().setCompleted(title);
        },
      );
    }
  }
}

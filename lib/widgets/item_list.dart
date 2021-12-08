import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:llapreview/services/services.dart';
import 'package:just_audio/just_audio.dart';

// class PlaySound extends StatefulWidget {
//   const PlaySound({Key? key}) : super(key: key);

//   @override
//   _PlaySoundState createState() => _PlaySoundState();
// }

// class _PlaySoundState extends State<PlaySound> {
//   @override
//   Widget build(BuildContext context) {
//     final player = AudioPlayer();
//     // var duration = await player.setAsset('audio/A/acara.mp3');
//     // print('!!!! $duration');
//     player.play();

//     return Container();
//   }
// }

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
      // scrollDirection: Axis.horizontal,
      // primary: true, /// ???
      // shrinkWrap: ,
    );
  }
}

class ItemCard extends StatelessWidget {
  final item;

  ItemCard(this.item);

  void playSound(String filename) async {
    final player = AudioPlayer();
    await player.setAsset('assets/audio/A/${filename}.mp3');
    player.play();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: IconButton(
              // Icons.play_arrow_rounded,
              // Icons.play_circle_outlined,
              icon: Icon(Icons.play_circle_rounded),
              tooltip: 'Play sound',
              iconSize: 50,
              onPressed: () => playSound('${item['title']}'),
            ),
            title: Text('${item['title']}'),
            subtitle: Text(
              '${item['description']}',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Container(
            // margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(20.0),
            // decoration: BoxDecoration(
            //   border: Border.all(color: Colors.grey),
            // ),
            child: Image.asset('assets/temp/temp1.jpeg'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '${item['details']}',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                onPressed: () {
                  // Perform some action
                },
                child: const Text('ACTION 1'),
              ),
              FlatButton(
                onPressed: () {
                  // Perform some action
                },
                child: const Text('ACTION 2'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

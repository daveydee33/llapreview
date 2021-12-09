import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:llapreview/services/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  Widget itemExamples(List<dynamic> examples) {
    // for each in Item, return a Text ('key : value');
    // return Text(item.toString());
    if (examples.isEmpty) {
      return Text('.');
    }

    var test = Column(
        children: examples
            .map((ex) => ListTile(
                  leading: IconButton(
                    icon: Icon(FontAwesomeIcons.solidPlayCircle),
                    onPressed: () {},
                  ),
                  title: Text('${ex['title']}'),
                  subtitle: Text('${ex['description']}'),
                ))
            .toList());

    return test;
    // return new Row(children: blah.map((item) => new Text(item)).toList());
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
              icon: const Icon(FontAwesomeIcons.solidPlayCircle),
              tooltip: 'Play sound',
              iconSize: 50,
              onPressed: () => playSound('${item['title']}'),
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
          itemExamples(item['examples']),
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

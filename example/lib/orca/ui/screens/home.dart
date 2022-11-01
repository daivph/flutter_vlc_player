import 'package:flutter/material.dart';

import '../../../widgets/validate_button.dart';
import 'external/vlc_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

Future<dynamic> pushScreen(BuildContext context, Widget page) async {
  Navigator.push(context, MaterialPageRoute(builder: (ctx) => page));
}

class HomePageState extends State<HomePage> {
  Map<String, String> errors = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'ORCA MObile',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              OrcaButton(
                  title: 'audio ac3',
                  color: Colors.blue,
                  onPressed: () {
                    pushScreen(
                      context,
                      const VideoPlayer(
                        playUrl:
                            'http://556677.ovh:25461/live/lmrrht6z/ywr0oota/2812.ts',
                      ),
                    );
                  }),
              const SizedBox(height: 10),
              OrcaButton(
                  title: 'audio mp2',
                  color: Colors.blue,
                  onPressed: () {
                    pushScreen(
                      context,
                      const VideoPlayer(
                        playUrl:
                            'http://556677.ovh:25461/live/lmrrht6z/ywr0oota/100802.ts',
                      ),
                    );
                  }),
              const SizedBox(height: 10),
              OrcaButton(
                title: 'video mpeg2 - audio mp2',
                color: Colors.blue,
                onPressed: () {
                  pushScreen(
                    context,
                    const VideoPlayer(
                      playUrl:
                          'http://restream.geniptv.com:8080/zid.maher/eJXiNlDIX1/6058',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

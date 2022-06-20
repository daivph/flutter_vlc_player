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
              ValidateButton(
                  title: 'Play mp4',
                  color: Colors.blue,
                  onPressed: () {
                    pushScreen(
                      context,
                      const VideoPlayer(
                        playUrl:
                            'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
                      ),
                    );
                  }),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

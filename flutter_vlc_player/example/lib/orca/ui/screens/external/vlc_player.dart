import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

import 'vlc_with_control.dart';

class VideoPlayer extends StatefulWidget {
  final String playUrl;
  const VideoPlayer({
    Key? key,
    required this.playUrl,
  }) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late VlcPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VlcPlayerController.network(
      widget.playUrl,
      hwAcc: HwAcc.disabled,
      options: VlcPlayerOptions(
        advanced: VlcAdvancedOptions([
          VlcAdvancedOptions.networkCaching(2000),
        ]),
        subtitle: VlcSubtitleOptions([
          VlcSubtitleOptions.boldStyle(true),
          VlcSubtitleOptions.fontSize(30),
          VlcSubtitleOptions.outlineColor(VlcSubtitleColor.yellow),
          VlcSubtitleOptions.outlineThickness(VlcSubtitleThickness.normal),
          // works only on externally added subtitles
          VlcSubtitleOptions.color(VlcSubtitleColor.navy),
        ]),
        http: VlcHttpOptions([
          VlcHttpOptions.httpReconnect(true),
        ]),
        rtp: VlcRtpOptions([
          VlcRtpOptions.rtpOverRtsp(true),
        ]),
      ),
    );

    _controller.addOnInitListener(() async {
      await _controller.startRendererScanning();
    });
    _controller.addOnRendererEventListener((type, id, name) {
      log('OnRendererEventListener $type $id $name');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VlcPlayerWithControls(
        showControls: false,
        controller: _controller,
      ),
    );
  }
}

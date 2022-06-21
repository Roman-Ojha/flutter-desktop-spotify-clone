import 'package:flutter/material.dart';
import 'package:spotify/data/data.dart';
import 'package:spotify/screens/playlist_screen.dart';
import 'package:spotify/widgets/widget.dart';

class Shell extends StatelessWidget {
  const Shell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            child: Row(
          children: [
            if (MediaQuery.of(context).size.width > 800) SideMenu(),
            // PlaylistScreen
            const Expanded(
              child: PlayListScreen(
                playlist: lofihiphopPlaylist,
              ),
            ),
          ],
        )),
        // Mini Player At the Button
        CurrentTrack(),
      ]),
    );
  }
}

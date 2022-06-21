import 'package:flutter/material.dart';
import 'package:spotify/widgets/side_menu.dart';

class Shell extends StatelessWidget {
  const Shell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            child: Row(
          children: [
            const SideMenu(),
            // PlaylistScreen
          ],
        )),
        // Mini Player At the Button
        Container(
          height: 84.0,
          width: double.infinity,
          color: Colors.blue,
        )
      ]),
    );
  }
}

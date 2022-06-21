import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      // we will add the primary color that we set
      color: Theme.of(context).primaryColor,
      height: double.infinity,
      child: Column(children: [
        // Side Menu Logo
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/img/spotify_logo.png',
                height: 55.0,
                filterQuality: FilterQuality.high,
              ),
            ),
          ],
        ),

        // List Tile
        _SizeMenuIconTab(
          iconData: Icons.home,
          title: "Home",
          onTap: () {},
        )
      ]),
    );
  }
}

class _SizeMenuIconTab extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;
  const _SizeMenuIconTab({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Theme.of(context).iconTheme.color,
        size: 28.0,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}

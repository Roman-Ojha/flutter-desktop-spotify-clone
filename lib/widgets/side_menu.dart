import 'package:flutter/material.dart';
import 'package:spotify/data/data.dart';

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
        ),
        _SizeMenuIconTab(
          iconData: Icons.search,
          title: "Search",
          onTap: () {},
        ),
        _SizeMenuIconTab(
          iconData: Icons.audiotrack,
          title: "Radio",
          onTap: () {},
        ),

        // Library PlayList
        const SizedBox(
          height: 12.0,
        ),
        const _LibraryPlaylist(),
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

class _LibraryPlaylist extends StatefulWidget {
  const _LibraryPlaylist({Key? key}) : super(key: key);

  @override
  State<_LibraryPlaylist> createState() => __LibraryPlaylistState();
}

class __LibraryPlaylistState extends State<_LibraryPlaylist> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        thumbVisibility: true,
        controller: _scrollController,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          physics: const ClampingScrollPhysics(),
          controller: _scrollController,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Text(
                    "YOUR LIBRARY",
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...yourLibrary
                    .map((e) => ListTile(
                          dense: true,
                          title: Text(
                            e,
                            style: Theme.of(context).textTheme.bodyText2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () {},
                        ))
                    .toList()
              ],
            ),
            const SizedBox(
              height: 24.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Text(
                    "YOUR PLAYLISTS",
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...playlists
                    .map((e) => ListTile(
                          dense: true,
                          title: Text(
                            e,
                            style: Theme.of(context).textTheme.bodyText2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () {},
                        ))
                    .toList()
              ],
            )
          ],
        ),
      ),
    );
  }
}

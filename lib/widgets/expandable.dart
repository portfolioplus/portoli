import 'package:flutter/material.dart';
import 'package:preferences/preference_service.dart';
import 'package:portoli/widgets/expansion_tile_custom.dart';

class Expandable extends StatelessWidget {
  final String perfKey;
  final String title;
  final List<Widget> children;

  const Expandable({Key key, this.perfKey, this.title, this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
        child: ExpansionTileCustom(
          onExpansionChanged: (val) {
            PrefService.setBool(this.perfKey, val);
          },
          initiallyExpanded: PrefService.getBool(this.perfKey) == null ||
              PrefService.getBool(this.perfKey),
          title: Text(title),
          children: children,
        ),
      ),
    );
  }
}

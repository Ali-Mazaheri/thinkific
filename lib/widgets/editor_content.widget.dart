import 'package:flutter/material.dart';
import 'package:thinkific/platforms/constants/app_constants.dart';
import 'package:thinkific/widgets/editor_row.widget.dart';

const data = [
  AppConstants.CURRENT_LOCATION,
  'Toronto',
  'Ottawa',
  'Edmonton',
  'Winnipeg',
  'Fredericton',
  'Halifax',
  'Charlottetown',
  'Regina',
  'Yellowknife',
  'Iqaluit',
  'Whitehorse',
];

class EditorContent extends StatelessWidget {
  final Function(String cityName) onSelect;
  const EditorContent({
    @required this.onSelect,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cities = data
        .map((e) => EditorRow(
              cityName: e,
              onClick: onSelect,
            ))
        .toList();
    return Expanded(
      child: ListView.separated(
        itemCount: cities.length,
        itemBuilder: (ctx, index) {
          return cities[index];
        },
        separatorBuilder: (ctx, index) {
          return const Divider(
            thickness: 2,
            indent: 5,
            endIndent: 5,
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget {
  final Function() onPress;
  const RefreshButton({this.onPress, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: IconButton(
        icon: const Icon(Icons.refresh),
        onPressed: onPress,
      ),
    );
  }
}

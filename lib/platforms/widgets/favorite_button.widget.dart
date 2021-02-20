import 'package:flutter/material.dart';
import 'package:thinkific/platforms/widgets/app_text_box.widget.dart';

class FavoriteButton extends StatelessWidget {
  final Function() onPress;

  const FavoriteButton({this.onPress, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppTextBox(
                'Favorite Cities',
                color: Colors.black,
              ),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: onPress,
              ),
            ],
          ),
          const Divider(
            indent: 10,
            endIndent: 10,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}

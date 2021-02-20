import 'package:flutter/material.dart';
import 'package:thinkific/platforms/widgets/app_text_box.widget.dart';

class EditorRow extends StatelessWidget {
  final String cityName;
  final Function(String cityName) onClick;
  const EditorRow({
    @required this.cityName,
    @required this.onClick,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      onPressed: () {
        onClick(cityName);
      },
      child: Container(
        child: Row(
          children: [
            const Flexible(
              flex: 1,
              child: Icon(
                Icons.location_on_outlined,
                color: Colors.blue,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Flexible(
              flex: 8,
              child: AppTextBox(
                cityName,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

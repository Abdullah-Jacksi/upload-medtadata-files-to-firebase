import 'package:flutter/material.dart';
import 'package:upload_medtadata_firebase/ui/utils/styles.dart';

class ItemRowWidget extends StatelessWidget {
  const ItemRowWidget({Key? key , required this.textKey, required this.textValue}) : super(key: key);
  final String textKey;
  final String textValue;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Text(
            textKey,
            style: headlineTextStyle,
          ),
          Flexible(
              child: Text(textValue)),
        ],
      ),
    );
  }
}

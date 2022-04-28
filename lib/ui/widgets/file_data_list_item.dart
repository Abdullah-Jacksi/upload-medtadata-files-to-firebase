import 'package:flutter/material.dart';
import 'package:upload_medtadata_firebase/core/models/file_model.dart';
import 'package:upload_medtadata_firebase/ui/widgets/item_row_widget.dart';

class FileDataListItem extends StatelessWidget {
  const FileDataListItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final MetadataFileModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ItemRowWidget(textKey:   "File Name: ",textValue: item
                .name,),
            ItemRowWidget(textKey: "File Type: ",textValue: item
                .type,),
            ItemRowWidget(textKey: "File Size: ",textValue:item
                .size ,),
            ItemRowWidget(textKey: "Upload Date: ",textValue: item
                .updateDate,),
          ],
        ),
      ),
    );
  }
}
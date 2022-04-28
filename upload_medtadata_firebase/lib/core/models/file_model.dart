import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:upload_medtadata_firebase/core/constants/api_constants.dart';

class MetadataFileModel {

  MetadataFileModel({required this.name, required this.type,required this.size, required this.updateDate});

  final String name;
  final String type;
  final String size;
  final String updateDate;


  MetadataFileModel.fromJson(Map<String, Object?> json)
      : this(
    name: json[APIConstants.fileName]! as String,
    type: json[APIConstants.fileType]! as String,
    size: json[APIConstants.fileSize]! as String,
    updateDate: json[APIConstants.fileUploadDate]! as String,
  );


  MetadataFileModel.fromSnapshot(Map<String, dynamic>? snapshot)
      : name = snapshot![APIConstants.fileName],
        type = snapshot[APIConstants.fileType],
        size = snapshot[APIConstants.fileSize],
        updateDate = snapshot[APIConstants.fileUploadDate];


  Map<String, Object?> toJson() {
    return {
      APIConstants.fileName: name,
      APIConstants.fileType: type,
      APIConstants.fileSize: size,
      APIConstants.fileUploadDate: updateDate,
    };
  }
}
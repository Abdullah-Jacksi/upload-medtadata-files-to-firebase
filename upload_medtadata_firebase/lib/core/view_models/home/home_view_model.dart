import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:upload_medtadata_firebase/core/constants/helper_functions.dart';
import 'package:upload_medtadata_firebase/core/models/file_model.dart';
import 'package:upload_medtadata_firebase/core/services/firebase_service.dart';
import 'package:upload_medtadata_firebase/core/view_models/base/base_view_model.dart';
import 'package:upload_medtadata_firebase/ui/utils/tiles.dart';

class HomeViewModel extends BaseViewModel {
  FirebaseService? firebaseService;
  List<MetadataFileModel>? _metadataFilesList = [];
  bool _isPickedFile = false;
  PlatformFile? _file;


  HomeViewModel({required FirebaseService firebaseService}){
    this.firebaseService = firebaseService;
    // fetchFilesDataList ();
  }

  List<MetadataFileModel>?  get getMetadataFilesList => _metadataFilesList;

  bool get getIsPickedFile => _isPickedFile;

  PlatformFile? get getFile => _file;


  Future<void> pickFile () async{
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.any);
    if (result != null) {
      _file = result.files.first;
      _isPickedFile = true;
      notifyListeners();
    } else {
      _isPickedFile = false;
      notifyListeners();
    }
  }

  Future<bool> uploadMetadataFile (PlatformFile? file , FirebaseService? firebaseService) async{
    if(file != null){
      String dateTime = getDateTimeNow();
      final kb = file.size / 1024;
      final mb = kb / 1024;
      String fileSize = mb >= 1 ? "${mb.toStringAsFixed(2)} MB" : "${kb.toStringAsFixed(2)} KB";

      Map<String, Object?> metadataFiles = MetadataFileModel(
          name: file.name,
          size: fileSize,
          updateDate: dateTime,
          type: file.extension!).toJson();

      bool result = await firebaseService!.uploadMetadataFile(metadataFiles);
      if(result){
        _isPickedFile = false;
        await fetchMetadataFilesList ();
        return true;
      }else{
        return false ;
      }
    }
    else{
      return false ;
    }
  }

  Future<void> uploadAndShowDialog (BuildContext context)async{

    bool result = await uploadMetadataFile(_file , firebaseService);

    if(result){
      return showWarningDialog(context: context , isError : false);
    }else{
      return showWarningDialog(context: context , isError : true) ;
    }
  }

  Future<void> fetchMetadataFilesList () async {
    setBusy(true);
    notifyListeners();
    _metadataFilesList = await firebaseService!.fetchMetadataFilesList();
    setBusy(false);
    notifyListeners();
  }

}

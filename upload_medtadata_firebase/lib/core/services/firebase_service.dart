import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:upload_medtadata_firebase/core/constants/api_constants.dart';
import 'package:upload_medtadata_firebase/core/models/file_model.dart';

class FirebaseService {
  FirebaseService({required this.firebaseFirestore});
  FirebaseFirestore firebaseFirestore;

  Future<bool> uploadMetadataFile (Map<String, Object?> object) async {

    try{
      await firebaseFirestore.collection(APIConstants.collectionFiles).add(object);
      return true;
    }
    on FirebaseException catch (error){
      print("Failed to upload metadata file: ${error.message}");
    }
    return false;
  }

  Future<List<MetadataFileModel>?> fetchMetadataFilesList () async {
    List<MetadataFileModel> list = [];
    try{
      await firebaseFirestore.collection(APIConstants.collectionFiles).get()
          .then((QuerySnapshot querySnapshot) {
        list = querySnapshot.docs.map((m) => MetadataFileModel.fromSnapshot(m.data() as Map<String, dynamic>?)).toList();
      });
      return list;
    }
    on FirebaseException catch (error){
      print("Failed to get metadata files list : ${error.message}");
    }
    return list = [];
  }


}

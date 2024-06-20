import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egomoya/src/model/celeb/celeb.dart';
import 'package:egomoya/src/repo/base_repo.dart';
import 'package:egomoya/util/helper/immutable_helper.dart';
import 'package:egomoya/util/request_result.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

final fireStorage = FirebaseStorage.instance;

class CelebRepo extends BaseRepo {
  final CollectionReference celebCollection = firestore.collection('celeb');
  Future<RequestResult<List<Celeb>>> fetchCelebList() =>
      handleRequest(() async {
        List<Celeb> result = [];
        QuerySnapshot snapshot = await celebCollection.get();
        for (var docSnapshot in snapshot.docs) {
          List<CelebItem> itemList = [];
          final data = docSnapshot.data() as Map<String, dynamic>;
          final Celeb celeb = Celeb.fromJson(data);
          String imgPath = await fireStorage
              .ref('images/celeb/thumbnails/${celeb.imgName}')
              .getDownloadURL();
          for (var item in celeb.itemList) {
            String itemImgPath = await fireStorage
                .ref('images/celeb/items/${item.imgName}')
                .getDownloadURL();
            itemList = [...itemList, item.copyWith(imgPath: itemImgPath)]
                .toImmutable();
          }
          result = [
            ...result,
            celeb.copyWith(
              imgPath: imgPath,
              itemList: itemList,
            )
          ].toImmutable();
        }
        return result;
      });
}

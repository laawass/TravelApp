import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalprojecttravelapp/models/Countries.dart';
class DatabaseService {

  final String uid;
  DatabaseService({this.uid});
  final CollectionReference koleksiNegara = Firestore.instance.collection('FavoriteCountry');

  Future favoriteCountry(String uid,String favorite,String city,String image,String place,String description) async {
    return await koleksiNegara.document(uid).setData({
      'uid' : uid,
      'favorite' : favorite,
      'place': place,
      'city': city,
      'image':image,
      'description': description,
      });
  }
  List<Countries> _countrieslistfromsnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
     return Countries(
       favorite: doc.data['favorite']??'false',
       country: doc.data['city'] ??'',
       image: doc.data['image']??'',
       place: doc.data['place']??'',
       description: doc.data['description']??'',
     );
    }).toList();
  }
  Stream<List<Countries>> get favorites {
    return koleksiNegara.snapshots()
        .map(_countrieslistfromsnapshot);
  }
}

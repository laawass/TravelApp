import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalprojecttravelapp/models/Restaurant.dart';
class DatabaseServiceRestaurant {

  final String uid;
  DatabaseServiceRestaurant({this.uid});
  final CollectionReference koleksiRestaurant = Firestore.instance.collection('Restaurant');

  Future favoriteRestaurant(String name,String country,String image,) async {
    return await koleksiRestaurant.document(uid).setData({
      'name' : name,
      'country': country,
      'image':image,
    });
  }
  List<FavRestaurant> _restaurantlistfromsnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return FavRestaurant(
        description: doc.data['description'] ??'',
        country: doc.data['country'] ??'',
        image: doc.data['image']??'',
        name: doc.data['name']??'',
        price: doc.data['price']??'',
        rate: doc.data['rate']??'',
      );
    }).toList();
  }
  Stream<List<FavRestaurant>> get favorites {
    return koleksiRestaurant.snapshots()
        .map(_restaurantlistfromsnapshot);
  }
}
class DatabaseServiceHotel {

  final String uid;
  DatabaseServiceHotel({this.uid});
  final CollectionReference koleksiHotel = Firestore.instance.collection('Hotels');

  Future favoritehotel(String name,String country,String image,) async {
    return await koleksiHotel.document(uid).setData({
      'name' : name,
      'country': country,
      'image':image,
    });
  }
  List<Favhotel> _hotellistfromsnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Favhotel(
        description: doc.data['description'] ??'',
        country: doc.data['country'] ??'',
        image: doc.data['image']??'',
        name: doc.data['name']??'',
        rate: doc.data['rate']??'',
        price: doc.data['price']??'',
      );
    }).toList();
  }
  Stream<List<Favhotel>> get favorites {
    return koleksiHotel.snapshots()
        .map(_hotellistfromsnapshot);
  }
}
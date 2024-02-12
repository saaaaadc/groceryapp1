import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetail(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userInfoMap);
  }

  UpdateUserWallet(String id, String amount) async {
    return await FirebaseFirestore.instance.collection('users').doc(id).update(
        {"Wallet": amount});
  }

  Future addFoodItem(Map<String, dynamic> userInfoMap, String name) async {
    return await FirebaseFirestore.instance.collection(name).add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getFoodItem(String name)async{
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }
  Future addFoodtoCart(Map<String, dynamic> userInfoMap, String? id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id).collection("Cart")
        .add(userInfoMap);
  }
  Future addFoodtoWishlist(Map<String, dynamic> userInfoMap, String? id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id).collection("Wishlist")
        .add(userInfoMap);
  }
  Future removeFromWishlist(String? id, String itemId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .collection("Wishlist")
          .doc(itemId)
          .delete();
      print("Item removed from wishlist successfully!");
    } catch (e) {
      print("Error removing item from wishlist: $e");
    }
  }

  Future<Stream<QuerySnapshot>> getFoodWishlist(String id)async{
    return await FirebaseFirestore.instance.collection("users").doc(id).collection("Wishlist").snapshots();
  }
  Future<Stream<QuerySnapshot>> getFoodCart(String id)async{
    return await FirebaseFirestore.instance.collection("users").doc(id).collection("Cart").snapshots();
  }

}
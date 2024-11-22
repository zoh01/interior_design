// import 'dart:async';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:interior_design/utils/exceptions/firebase_exceptions.dart';
// import 'package:interior_design/utils/exceptions/plaform_exceptions.dart';
//
// /// Repository for managing product-related data and operations
// class ProductRepository extends GetxController {
//   static ProductRepository get instance => Get.find();
//
//   /// Firestore instance for database interactions.
//   final _db = FirebaseFirestore.instance;
//
//   /// Get limited featured products
//   Future<List<ProductModel>> getFeaturedProducts() async {
//     try {
//       final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).limit(4).get();
//       return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
//     } on FirebaseException catch (e) {
//       throw ZFirebaseException(e.code).message;
//     } on PlatformException catch (e){
//       throw ZPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong. Please try again';
//     }
//   }
//
//   /// Get limited featured products
//   Future<List<ProductModel>> getAllFeaturedProducts() async {
//     try {
//       final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).get();
//       return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
//     } on FirebaseException catch (e) {
//       throw ZFirebaseException(e.code).message;
//     } on PlatformException catch (e) {
//       throw ZPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong, Please try again';
//     }
//   }
//
//   /// Get product based on the Query
//   Future<List<ProductModel>> fetchProductByQuery(Query query) async {
//     try {
//       final querySnapshot = await query.get();
//       final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
//       return productList;
//     } on FirebaseException catch (e) {
//       throw ZFirebaseException(e.code).message;
//     } on PlatformException catch (e) {
//       throw ZPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong, Please try again.';
//     }
//   }
//
//   /// Get product based ob query
//   Future<List<ProductModel>> getFavoriteProducts(List<String> productIds) async {
//     try {
//       final snapShot = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();
//       return snapShot.docs.map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot)).toList();
//     } on FirebaseException catch (e) {
//       throw ZFirebaseException(e.code).message;
//     } on PlatformException catch (e) {
//       throw ZPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong, Please try again';
//     }
//   }
//
//   Future<List<ProductModel>> getProductForBrand({required String brandId, int limit = -1}) async {
//     try {
//       final querySnapshot = limit == -1
//           ? await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).get()
//           : await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).limit(limit).get();
//
//       final products = querySnapshot.docs.map((e) => ProductModel.fromSnapshot(doc)).toList();
//
//       return products;
//     } on FirebaseException catch (e) {
//       throw ZFirebaseException(e.code).message;
//     } on PlatformException catch (e) {
//       throw ZPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong, Please try again';
//     }
//   }
// }
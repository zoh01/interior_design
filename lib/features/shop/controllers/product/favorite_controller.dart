// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:interior_design/utils/local_storage/storage_utility.dart';
// import 'package:interior_design/utils/popups/loaders.dart';
//
// class FavouritesController extends GetxController {
//   static FavouritesController get instance => Get.find();
//
//   /// Variables
//   final favorites = <String, bool>{}.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     initFavorites();
//   }
//
//   // Method to initialize favorites by reading from storage
//   Future<void> initFavorites() async{
//     final json = TLocalStorage.instance().readData('favorites');
//     if (json != null) {
//       final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
//       favorites.assignAll(storedFavorites.map((key, value) => MapEntry(key, value as bool)));
//     }
//   }
//
//   bool isFavorite(String productId) {
//     return favorites[productId] ?? false;
//   }
//
//   void toggleFavoriteProduct(String productId) {
//     if(!favorites.containsKey(productId)) {
//       favorites[productId] = true;
//       saveFavoritesToStorage();
//       ZLoaders.customToast(message: 'Product has been added to the WishList');
//     } else {
//       TLocalStorage.instance().removeData(productId);
//       favorites.remove(productId);
//       saveFavoritesToStorage();
//       favorites.refresh();
//       ZLoaders.customToast(message: 'Product has been removed from the Wishlist');
//     }
//   }
//
//   void saveFavoritesToStorage() {
//     final encodedFavorites = json.encode(favorites);
//     TLocalStorage.instance().saveData('favorites', encodedFavorites);
//   }
//
//   Future<List<ProductModel>> favoriteProducts() async {
//     return await ProductRepository.instance.getFavoriteProducts(favorites.keys.toList());
//   }
// }

import 'dart:developer';

import 'package:codeedex/models/banner_model.dart';
import 'package:codeedex/models/category_model.dart';
import 'package:codeedex/models/product_models.dart';
import 'package:codeedex/servieces/backend_servieces.dart';
import 'package:codeedex/servieces/local_storage_service.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoading = false;

  List<ProductModel> products = [];
  List<BannerModel> banners = [];
  List<CategoryModel> categories = [];

  final BackendServices backendServices = BackendServices();
  final LocalStorageService localStorageService = LocalStorageService();

  Future<void> fetchHomeData() async {
    isLoading = true;
    notifyListeners();

    try {
      final token = await localStorageService.getToken();
      final response = await backendServices.fetchHome(
        token: token!,
        id: '80y',
      );

      if (response.statusCode == 200 && response.data['success'] == 1) {
        banners = (response.data['banner1'] as List)
            .map((e) => BannerModel.fromJson(e))
            .toList();

        products = (response.data['newarrivals'] as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();

        categories = (response.data['categories'] as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
        log(response.data['categories'].toString());
      }
    } catch (e) {
      log('Home error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

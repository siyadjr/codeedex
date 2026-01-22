import 'package:flutter/material.dart';
import 'package:codeedex/core/theme/app_colors.dart';

class AppBarIcons {
  static List<Widget> actions() {
    return [
      IconButton(
        icon: const Icon(Icons.search, color: AppColors.surfaceWhite),
        onPressed: () {
          // Handle search
        },
      ),
      IconButton(
        icon: const Icon(
          Icons.favorite_outline,
          color: AppColors.surfaceWhite,
        ),
        onPressed: () {
          // Handle wishlist
        },
      ),
      IconButton(
        icon: const Icon(
          Icons.notifications_none,
          color: AppColors.surfaceWhite,
        ),
        onPressed: () {
          // Handle notifications
        },
      ),
    ];
  }
}

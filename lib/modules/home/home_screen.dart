import 'package:codeedex/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: Image.asset('assets/homescreen appbar icon.png'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.surfaceWhite),
            onPressed: () {
              // Handle notification icon press
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.favorite_outline,
              color: AppColors.surfaceWhite,
            ),
            onPressed: () {
              // Handle notification icon press
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: AppColors.surfaceWhite,
            ),
            onPressed: () {
              // Handle notification icon press
            },
          ),
        ],
      ),
      body: Center(child: Column(children: [
        
      ],)),
    );
  }
}

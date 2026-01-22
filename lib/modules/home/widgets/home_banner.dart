import 'package:flutter/material.dart';
import 'package:codeedex/core/theme/app_colors.dart';

class HomeBanner extends StatelessWidget {
  final Color mainColor;
  final Color secondaryColor;
  const HomeBanner({super.key,required this.mainColor,required this.secondaryColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 20, right: 20),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              mainColor,
              secondaryColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            // 🔹 TEXT CONTENT
            // 🔹 PRODUCT IMAGE
            Positioned(
              right: 8,
              bottom: 8,
              child: SizedBox(
                height: 180,
                child: Image.asset(
                  'assets/Product Image.png',
                  height: 140,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hurry Up! Get 10% Off',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Go Natural with\nUnpolished Grains',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),

                  const Spacer(),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Shop Now',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.highlight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

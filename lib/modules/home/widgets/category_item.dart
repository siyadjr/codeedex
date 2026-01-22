import 'package:codeedex/widgets/custom_shimmer.dart';
import 'package:codeedex/widgets/image_helper.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String image;
  final String title;

  const CategoryItem({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Image.network(
            ImageHelper.category(image),
            height: 70,
            width: 70,
            fit: BoxFit.cover,

            /// 🔹 SHIMMER WHILE LOADING
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;

              return const ShimmerBox(
                height: 70,
                width: 70,
                shape: CircleBorder(),
              );
            },

            /// 🔹 FALLBACK IF IMAGE FAILS
            errorBuilder: (context, error, stackTrace) {
              return const CircleAvatar(
                radius: 35,
                backgroundColor: Colors.grey,
                child: Icon(Icons.image_not_supported, color: Colors.white),
              );
            },
          ),
        ),

        const SizedBox(height: 8),

        SizedBox(
          width: 80,
          child: Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

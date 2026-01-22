import 'package:codeedex/core/theme/app_colors.dart';
import 'package:codeedex/modules/home/controller/home_provider.dart';
import 'package:codeedex/modules/home/widgets/app_bar_icons.dart';
import 'package:codeedex/modules/home/widgets/category_section.dart';
import 'package:codeedex/modules/home/widgets/home_banner.dart';
import 'package:codeedex/modules/home/widgets/product_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.fetchHomeData();
    });
    return Scaffold(
      backgroundColor: AppColors.surfaceWhite,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: Image.asset('assets/homescreen appbar icon.png'),
        actions: AppBarIcons.actions(),
      ),
      body: SingleChildScrollView(
        child: Consumer<HomeProvider>(
          builder: (context, provider, child) => Center(
            child: provider.isLoading
                ? Expanded(
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                          child: PageView(
                            children: [
                              HomeBanner(
                                mainColor: const Color.fromARGB(
                                  255,
                                  245,
                                  119,
                                  22,
                                ),
                                secondaryColor: AppColors.highlight,
                              ),
                              HomeBanner(
                                mainColor: const Color.fromARGB(
                                  255,
                                  75,
                                  185,
                                  232,
                                ),
                                secondaryColor: AppColors.highlight2,
                              ),
                              HomeBanner(
                                mainColor: const Color.fromARGB(
                                  255,
                                  248,
                                  92,
                                  191,
                                ),
                                secondaryColor: AppColors.highlight3,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        CategoriesSection(categories: provider.categories),
                        SizedBox(height: 10),
                        Divider(color: AppColors.appBackground, thickness: 8),
                        SizedBox(height: 10),
                        FeaturedProductsSection(
                          title: 'Featured Products',
                          products: provider.products,
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: HomeBanner(
                            mainColor: const Color.fromARGB(255, 132, 56, 208),
                            secondaryColor: AppColors.highlight4,
                          ),
                        ),
                        SizedBox(height: 10),
                        FeaturedProductsSection(
                          title: 'Recently Added',
                          products: provider.products,
                        ),
                        SizedBox(height: 10),
                        FeaturedProductsSection(
                          title: 'Popular Products',
                          products: provider.products,
                        ),
                        SizedBox(height: 10),
                        FeaturedProductsSection(
                          title: 'Trending Products',
                          products: provider.products,
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

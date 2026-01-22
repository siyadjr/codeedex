import 'package:codeedex/core/theme/app_colors.dart';
import 'package:codeedex/modules/auth/controller/auth_provider.dart'
    show AuthProvider;
import 'package:codeedex/modules/auth/widgets/auth_section.dart';
import 'package:codeedex/modules/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authProvider = context.watch<AuthProvider>();

    final bool isButtonEnabled =
        authProvider.emailController.text.isNotEmpty &&
        authProvider.passwordController.text.isNotEmpty &&
        !authProvider.isLoading;

    return Scaffold(
      backgroundColor: AppColors.appBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🖼 IMAGE BAR (unchanged)
              FadeInDown(
                preferences: AnimationPreferences(
                  duration: const Duration(milliseconds: 800),
                ),
                child: Container(
                  height: size.height * 0.45,
                  width: double.infinity,
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/loginimage.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                      );
                    },
                    child: const Text(
                      'Skip >',
                      style: TextStyle(
                        color: AppColors.surfaceWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              // 🔽 LOGIN CONTENT
              FadeInUp(
                preferences: AnimationPreferences(
                  duration: const Duration(milliseconds: 800),
                ),
                child: AuthSection(
                  authProvider: authProvider,
                  isButtonEnabled: isButtonEnabled,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

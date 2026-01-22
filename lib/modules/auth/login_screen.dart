import 'dart:developer';

import 'package:codeedex/core/theme/app_colors.dart';
import 'package:codeedex/modules/auth/controller/auth_provider.dart'
    show AuthProvider;
import 'package:codeedex/modules/home/home_screen.dart';
import 'package:codeedex/widgets/custom_snackbar.dart';
import 'package:codeedex/widgets/custom_textform_field.dart';
import 'package:flutter/material.dart';
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
              Container(
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

              // 🔽 LOGIN CONTENT
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: AppColors.appBackground,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    const SizedBox(height: 24),

                    const Text('Email Address'),
                    const SizedBox(height: 8),
                    CustomTextField(
                      hintText: 'Johndoe@gmail.com',
                      keyboardType: TextInputType.emailAddress,
                      controller: authProvider.emailController,
                    ),

                    const SizedBox(height: 16),

                    const Text('Password'),
                    const SizedBox(height: 8),
                    CustomTextField(
                      hintText: 'Password',
                      obscureText: true,
                      controller: authProvider.passwordController,
                      suffixIcon: const Icon(Icons.visibility_off),
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Forgot password?'),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // ✅ LOGIN BUTTON WITH VALIDATION COLOR
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isButtonEnabled
                              ? AppColors.primary
                              : Colors.grey, // 👈 gray when not validated
                        ),
                        onPressed: isButtonEnabled
                            ? () async {
                                final success = await authProvider.login();
                                log('succes is $success');
                                if (success && context.mounted) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const HomeScreen(),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    CustomSnackBar.error(
                                      authProvider.errorMessage,
                                    ),
                                  );
                                }
                              }
                            : null,
                        // 👈 disables button
                        child: authProvider.isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'Login',
                                style: TextStyle(
                                  color: AppColors.surfaceWhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    Center(
                      child: RichText(
                        text: const TextSpan(
                          text: "Don’t have an account? ",
                          style: TextStyle(color: AppColors.textPrimary),
                          children: [
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

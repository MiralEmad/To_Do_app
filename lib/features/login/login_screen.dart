import 'package:flutter/material.dart';
import 'package:todo_app/core/l10n/app_localization.dart';
import '../../core/l10n/app_localization.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/responsive.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameController =
      TextEditingController();

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _onContinue(AppLocalizations t) {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => HomeScreen(
            userName: _nameController.text.trim(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations t =
        AppLocalizations.of(context);

    final double avatarSize =
        context.isTablet ? 140.0 : 110.0;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ResponsiveCenter(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: context.hPadding,
                vertical: 24,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.stretch,
                  children: [
                    // =========================
                    // Profile Icon
                    // =========================

                    Center(
                      child: Container(
                        width: avatarSize,
                        height: avatarSize,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE7E9F7),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person,
                          size: avatarSize * 0.5,
                          color: AppColors.primary,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: context.sp(28),
                    ),

                    // =========================
                    // Title
                    // =========================

                    Text(
                      t.createYourProfile,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: context.sp(24),
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    SizedBox(
                      height: context.sp(8),
                    ),

                    // =========================
                    // Subtitle
                    // =========================

                    Text(
                      t.addNamePhoto,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: context.sp(14),
                        color: AppColors.textSecondary,
                      ),
                    ),

                    SizedBox(
                      height: context.sp(36),
                    ),

                    // Full Name Label

                    Align(
                      alignment:
                          AlignmentDirectional.centerStart,
                      child: Text(
                        t.fullName,
                        style: TextStyle(
                          fontSize: context.sp(14),
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: context.sp(8),
                    ),

                    // =========================
                    // Name TextField
                    // =========================

                    TextFormField(
                      controller: _nameController,
                      textInputAction:
                          TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: t.fullNameHint,
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty) {
                          return t.nameRequired;
                        }

                        return null;
                      },
                      onFieldSubmitted: (_) {
                        _onContinue(t);
                      },
                    ),

                    SizedBox(
                      height: context.sp(28),
                    ),

                    // =========================
                    // Continue Button
                    // =========================

                    ElevatedButton(
                      onPressed: () {
                        _onContinue(t);
                      },

                      style: ElevatedButton.styleFrom(
                        // لون خلفية الزرار
                        backgroundColor: AppColors.primary,

                        // لون الكلام
                        foregroundColor: Colors.white,

                        minimumSize: const Size(
                          double.infinity,
                          52,
                        ),

                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30),
                        ),

                        elevation: 0,
                      ),

                      child: Text(
                        t.continueBtn,
                        style: TextStyle(
                          fontSize: context.sp(16),
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    SizedBox(
                      height:
                          context.screenHeight * 0.04,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
    
import 'package:flutter/material.dart';
import '../config/app_theme.dart';
import '../config/routes.dart';
import '../constants/app_constants.dart';
import '../l10n/app_localizations.dart';

/// Halaman splash dengan animasi modern.
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppTheme.animationDuration * 6,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: AppTheme.animationCurve),
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: AppTheme.animationCurve),
    );

    _controller.forward();

    Future.delayed(AppConstants.splashDuration, () {
      Navigator.pushReplacementNamed(context, Routes.home);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: LayoutBuilder(
              builder: (context, constraints) {
                double fontSize = constraints.maxWidth * 0.1;
                if (fontSize < AppTheme.fontSizeSmall)
                  fontSize = AppTheme.fontSizeSmall;
                if (fontSize > AppTheme.fontSizeMedium)
                  fontSize = AppTheme.fontSizeMedium;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      AppTheme.splashIcon,
                      size:
                          constraints.maxWidth *
                          AppTheme.splashIconSizeMultiplier,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      l10n.translate('splash_title'),
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(fontSize: fontSize),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/app_theme.dart';
import '../l10n/app_localizations.dart';
import '../view_models/counter_view_model.dart';
import '../view_models/localization_view_model.dart';
import '../view_models/theme_view_model.dart';

/// Halaman utama aplikasi dengan counter, tema, dan bahasa.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterViewModel = Provider.of<CounterViewModel>(context);
    final themeViewModel = Provider.of<ThemeViewModel>(context);
    final localizationViewModel = Provider.of<LocalizationViewModel>(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.translate('app_title')),
        actions: [
          IconButton(
            icon: Icon(
              themeViewModel.themeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: themeViewModel.toggleTheme,
            tooltip: l10n.translate('toggle_theme'),
          ),
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: localizationViewModel.toggleLanguage,
            tooltip: l10n.translate('toggle_language'),
          ),
        ],
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.translate('count_label'),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 12),
                Text(
                  '${counterViewModel.count}',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildButton(
                      context,
                      icon: Icons.remove,
                      label: l10n.translate('decrement_button'),
                      onPressed: counterViewModel.decrement,
                    ),
                    const SizedBox(width: 20),
                    _buildButton(
                      context,
                      icon: Icons.add,
                      label: l10n.translate('increment_button'),
                      onPressed: counterViewModel.increment,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Membuat tombol dengan animasi hover.
  Widget _buildButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return AnimatedContainer(
      duration: AppTheme.animationDuration,
      curve: AppTheme.animationCurve,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 24),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.buttonBorderRadius),
          ),
        ),
      ),
    );
  }
}

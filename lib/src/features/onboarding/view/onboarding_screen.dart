import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../onboarding/controller/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppTheme.darkBgTop, AppTheme.darkBgBottom],
        ),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(child: _OnboardingBody()),
      ),
    );
  }
}

class _OnboardingBody extends StatelessWidget {
  const _OnboardingBody();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<OnboardingController>();
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              _BeforeAfterRow(),
              const SizedBox(height: 24),
              Text('Selected Items',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: controller.available
                    .map((g) => _SelectableChip(
                          label: g.name,
                          selected: controller.selectedIds.contains(g.id),
                          onTap: () => controller.toggle(g.id),
                          icon: g.icon,
                        ))
                    .toList(),
              ),
              const SizedBox(height: 36),
              Text(
                '1-Click to Try On\nTrendy Outfits',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                'See yourself in the latest fashion instantly with our AI-powered try-on technology.',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.white70),
              ),
              const SizedBox(height: 24),
              const _PagerDots(),
              const SizedBox(height: 24),
              _PrimaryButton(
                text: 'Next',
                onPressed: () {},
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}

class _BeforeAfterRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        _FramedPhoto(label: 'Before', image: 'assets/images/before.jpg'),
        _ArrowStar(),
        _FramedPhoto(label: 'After', image: 'assets/images/after.jpg', highlight: true),
      ],
    );
  }
}

class _FramedPhoto extends StatelessWidget {
  final String label;
  final String image;
  final bool highlight;
  const _FramedPhoto({required this.label, required this.image, this.highlight = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 190,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppTheme.cardOutline, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: highlight ? AppTheme.accentPurple : Colors.black54,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(label,
                  style: const TextStyle(fontWeight: FontWeight.w700)),
            ),
          ),
        ],
      ),
    );
  }
}

class _ArrowStar extends StatelessWidget {
  const _ArrowStar();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(Icons.star, color: Colors.amber, size: 28),
        SizedBox(height: 8),
        Icon(Icons.arrow_forward, color: Colors.white, size: 36),
      ],
    );
  }
}

class _SelectableChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final String icon;
  const _SelectableChip({required this.label, required this.selected, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? AppTheme.cardOutline : Colors.white24,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 6, right: 6),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: selected ? Colors.greenAccent : Colors.transparent,
                    child: selected
                        ? const Icon(Icons.check, size: 14, color: Colors.black)
                        : const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Icon(Icons.shopping_bag, color: Colors.white70),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}

class _PagerDots extends StatelessWidget {
  const _PagerDots();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _dot(true),
        const SizedBox(width: 8),
        _dot(false),
        const SizedBox(width: 8),
        _dot(false),
      ],
    );
  }

  Widget _dot(bool active) => Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: active ? AppTheme.accentPurple : Colors.white24,
        ),
      );
}

class _PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const _PrimaryButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppTheme.accentBlue, AppTheme.accentPurple],
          ),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.symmetric(vertical: 18),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}


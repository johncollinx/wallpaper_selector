import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/category_provider.dart';
import '../widgets/category_card.dart';
import '../widgets/top_nav_button.dart';
import '../models/wallpaper_model.dart';
import 'preview_page.dart'; // WallpaperStudioPage
import '../widgets/hero_section_browse.dart'; // Your hero section widget

class BrowseCategoryPage extends ConsumerStatefulWidget {
  const BrowseCategoryPage({super.key});

  @override
  ConsumerState<BrowseCategoryPage> createState() => _BrowseCategoryPageState();
}

class _BrowseCategoryPageState extends ConsumerState<BrowseCategoryPage> {
  String _selectedRoute = '/browse';
  bool _isGridView = true;

  void _onNavTap(String route) {
    if (_selectedRoute == route) return;
    setState(() => _selectedRoute = route);
    Navigator.pushNamed(context, route);
  }

  void _goToPreview(Map<String, dynamic> category) {
    final wallpapers =
        (category['wallpapers'] as List<dynamic>).cast<WallpaperModel>();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => WallpaperStudioPage(
          category: category['title'] ?? '',
          wallpapers: wallpapers,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoryProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 900;
            final crossAxisCount =
                isWide ? 4 : (constraints.maxWidth > 600 ? 3 : 2);

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 28),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔝 Top Navigation Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      child: Row(
                        children: [
                          // App Logo
                          Row(
                            children: [
                              Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFFFA726),
                                      Color(0xFFE91E63)
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Wallpaper Studio',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              TopNavButton(
                                icon: Icons.home_outlined,
                                label: 'Home',
                                selected: _selectedRoute == '/',
                                onTap: () => _onNavTap('/'),
                              ),
                              const SizedBox(width: 12),
                              TopNavButton(
                                icon: Icons.grid_view_rounded,
                                label: 'Browse',
                                selected: _selectedRoute == '/browse',
                                onTap: () => _onNavTap('/browse'),
                              ),
                              const SizedBox(width: 12),
                              TopNavButton(
                                icon: Icons.favorite_border,
                                label: 'Favourites',
                                selected: _selectedRoute == '/favourites',
                                onTap: () => _onNavTap('/favourites'),
                              ),
                              const SizedBox(width: 12),
                              TopNavButton(
                                icon: Icons.settings_outlined,
                                label: 'Settings',
                                selected: _selectedRoute == '/settings',
                                onTap: () => _onNavTap('/settings'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                        height: 1, thickness: 1, color: Color(0xFFECECEC)),

                    // 🦄 Hero Section
                    HeroSection(isWide: isWide),
                    const SizedBox(height: 36),

                    // Header + Grid/List Toggle
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Browse Categories',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        IconButton(
                          tooltip: _isGridView
                              ? 'Switch to List View'
                              : 'Switch to Grid View',
                          icon: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            transitionBuilder: (child, animation) =>
                                RotationTransition(
                              turns: Tween<double>(begin: 0.75, end: 1.0)
                                  .animate(animation),
                              child: FadeTransition(
                                  opacity: animation, child: child),
                            ),
                            child: Icon(
                              _isGridView
                                  ? Icons.view_list_rounded
                                  : Icons.grid_view_rounded,
                              key: ValueKey(_isGridView),
                            ),
                          ),
                          onPressed: () =>
                              setState(() => _isGridView = !_isGridView),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),

                    // 🌀 Animated Grid/List Switcher
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      switchInCurve: Curves.easeInOut,
                      switchOutCurve: Curves.easeInOut,
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0.05, 0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          ),
                        );
                      },
                      child: _isGridView
                          ? GridView.builder(
                              key: const ValueKey('grid'),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                childAspectRatio: 0.9,
                              ),
                              itemCount: categories.length,
                              itemBuilder: (context, index) {
                                final category = categories[index];
                                return CategoryCard(
                                  title: category['title'] ?? 'Untitled',
                                  subtitle: category['subtitle'] ?? '',
                                  count: category['count'] ?? 0,
                                  image: category['image'] ?? '',
                                  onTap: () => _goToPreview(category),
                                  isListView: false,
                                );
                              },
                            )
                          : Column(
                              key: const ValueKey('list'),
                              children: categories.map((category) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 18),
                                  child: CategoryCard(
                                    title: category['title'] ?? 'Untitled',
                                    subtitle: category['subtitle'] ?? '',
                                    count: category['count'] ?? 0,
                                    image: category['image'] ?? '',
                                    onTap: () => _goToPreview(category),
                                    isListView: true,
                                  ),
                                );
                              }).toList(),
                            ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

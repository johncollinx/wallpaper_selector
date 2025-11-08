import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/hero_section.dart';
import '../widgets/category_card.dart';
import '../widgets/categories_grid.dart';
import '../providers/category_provider.dart';
import '../widgets/top_nav_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedRoute = '/';

  void _onNavTap(String route) {
    if (_selectedRoute == route) return;
    setState(() => _selectedRoute = route);
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          final isWide = constraints.maxWidth > 900;
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                child: Row(
                  children: [
                    // Logo
                    Row(
                      children: [
                        Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [Color(0xFFFFA726), Color(0xFFE91E63)]),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text('Wallpaper Studio',
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const Spacer(),

                    // Navigation
                    Row(children: [
                      TopNavButton(
                          icon: Icons.home_outlined,
                          label: 'Home',
                          selected: _selectedRoute == '/',
                          onTap: () => _onNavTap('/')),
                      const SizedBox(width: 12),
                      TopNavButton(
                          icon: Icons.grid_view,
                          label: 'Browse',
                          selected: _selectedRoute == '/browse',
                          onTap: () => _onNavTap('/browse')),
                      const SizedBox(width: 12),
                      TopNavButton(
                          icon: Icons.favorite_border,
                          label: 'Favourites',
                          selected: _selectedRoute == '/favourites',
                          onTap: () => _onNavTap('/favourites')),
                      const SizedBox(width: 12),
                      TopNavButton(
                          icon: Icons.settings_outlined,
                          label: 'Settings',
                          selected: _selectedRoute == '/settings',
                          onTap: () => _onNavTap('/settings')),
                    ])
                  ],
                ),
              ),
              const Divider(height: 1, thickness: 1, color: Color(0xFFECECEC)),
              Expanded(
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 28),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeroSection(isWide: isWide),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Categories',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold, fontSize: 22)),
                            TextButton(
                                onPressed: () =>
                                    Navigator.pushNamed(context, '/browse'),
                                child: const Text('See All'))
                          ],
                        ),
                        const SizedBox(height: 18),
                        CategoriesGrid(isWide: isWide),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}

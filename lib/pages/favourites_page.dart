import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/wallpaper_model.dart';
import '../providers/favourites_provider.dart';
import '../widgets/top_nav_button.dart';
import 'preview_page.dart';

class FavouritesPage extends ConsumerStatefulWidget {
  const FavouritesPage({super.key});

  @override
  ConsumerState<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends ConsumerState<FavouritesPage> {
  String _selectedRoute = '/favourites';

  void _onNavTap(String route) {
    if (_selectedRoute == route) return;
    setState(() => _selectedRoute = route);
    Navigator.pushNamed(context, route);
  }

  Future<void> _openPreview(WallpaperModel wallpaper) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => WallpaperStudioPage(
          category: "Favourites",
          wallpapers: [wallpaper],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final favourites = ref.watch(favouritesProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // 🧭 Top Navigation
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
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
                            colors: [Color(0xFFFFA726), Color(0xFFE91E63)],
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
                        icon: Icons.grid_view,
                        label: 'Browse',
                        selected: _selectedRoute == '/browse',
                        onTap: () => _onNavTap('/browse'),
                      ),
                      const SizedBox(width: 12),
                      TopNavButton(
                        icon: Icons.favorite,
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

            const Divider(height: 1, thickness: 1, color: Color(0xFFECECEC)),

            // ❤️ Favourites Content
            Expanded(
              child: favourites.isEmpty
                  ? Center(
                      child: Text(
                        'No saved wallpapers yet',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.grey[500],
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 28),
                      child: GridView.builder(
                        itemCount: favourites.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              MediaQuery.of(context).size.width ~/ 220,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.75,
                        ),
                        itemBuilder: (context, index) {
                          final wallpaper = favourites[index];

                          return GestureDetector(
                            onTap: () => _openPreview(wallpaper),
                            child: Stack(
                              children: [
                                // Wallpaper thumbnail
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                      image: AssetImage(wallpaper.image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                // Overlay
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.black.withOpacity(0.25),
                                  ),
                                ),

                                // Wallpaper title
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Text(
                                    wallpaper.title,
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),

                                // Remove from favourites button
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: GestureDetector(
                                    onTap: () => ref
                                        .read(favouritesProvider.notifier)
                                        .remove(wallpaper),
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: Colors.black38,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: const Icon(
                                        Icons.delete_outline,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

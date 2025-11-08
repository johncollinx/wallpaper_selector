import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/category_provider.dart';
import '../pages/preview_page.dart';
import '../models/wallpaper_model.dart';
import 'category_card.dart';

class CategoriesGrid extends ConsumerWidget {
  final bool isWide;
  const CategoriesGrid({super.key, required this.isWide});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryProvider);

    final crossAxisCount = isWide ? 4 : 2;
    final spacing = isWide ? 20.0 : 12.0;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,
        childAspectRatio: isWide ? 1.4 : 1,
      ),
      itemBuilder: (context, index) {
        final category = categories[index];
        final wallpapers = category['wallpapers'] as List<WallpaperModel>;

        return CategoryCard(
          title: category['title'] as String,
          subtitle: category['subtitle'] as String,
          count: category['count'] as int,
          image: category['image'] as String,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => WallpaperStudioPage(
                  category: category['title'] as String,
                  wallpapers: wallpapers,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

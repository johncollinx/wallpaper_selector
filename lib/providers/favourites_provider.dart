import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/wallpaper_model.dart';

final favouritesProvider =
    StateNotifierProvider<FavouritesNotifier, List<WallpaperModel>>((ref) {
  return FavouritesNotifier();
});

class FavouritesNotifier extends StateNotifier<List<WallpaperModel>> {
  FavouritesNotifier() : super([]);

  void add(WallpaperModel wallpaper) {
    if (!state.any((w) => w.id == wallpaper.id)) {
      wallpaper.isFavourite = true;
      state = [...state, wallpaper];
    }
  }

  void remove(WallpaperModel wallpaper) {
    wallpaper.isFavourite = false;
    state = state.where((w) => w.id != wallpaper.id).toList();
  }

  void toggle(WallpaperModel wallpaper) {
    if (state.any((w) => w.id == wallpaper.id)) {
      remove(wallpaper);
    } else {
      add(wallpaper);
    }
  }
}

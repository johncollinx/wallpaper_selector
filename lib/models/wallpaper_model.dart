// lib/models/wallpaper_model.dart

class WallpaperModel {
  final String id;
  final String title; // Wallpaper title
  final String image; // Local asset or URL
  final List<String> tags; // e.g., ["Nature", "Forest"]
  final String description; // Optional description
  final String category; // Add category field
  bool isFavourite; // Mutable for toggling favourites

  WallpaperModel({
    required this.id,
    required this.title,
    required this.image,
    required this.tags,
    required this.description,
    required this.category,
    this.isFavourite = false,
  });
}

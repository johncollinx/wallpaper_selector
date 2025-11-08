// lib/providers/category_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/wallpaper_model.dart';

final categoryProvider = Provider<List<Map<String, dynamic>>>((ref) {
  return [
    {
      'title': 'Nature',
      'subtitle': 'Mountains and Landscapes',
      'count': 3,
      'image': 'assets/nature.png',
      'wallpapers': [
        WallpaperModel(
          id: 'nature_1',
          title: 'Nature 1',
          image: 'assets/nature1.jpg',
          tags: ['Nature', 'Flowers'],
          description: 'Discover the pure beauty of Nature 1.',
          category: 'Nature', // Added category
        ),
        WallpaperModel(
          id: 'nature_2',
          title: 'Nature 2',
          image: 'assets/nature2.jpg',
          tags: ['Nature', 'Mountains'],
          description: 'Experience serenity with mountains.',
          category: 'Nature',
        ),
        WallpaperModel(
          id: 'nature_3',
          title: 'Nature 3',
          image: 'assets/nature3.jpg',
          tags: ['Nature', 'Forest'],
          description: 'Immerse in warm autumn foliage.',
          category: 'Nature',
        ),
        WallpaperModel(
          id: 'nature_4',
          title: 'Nature 4',
          image: 'assets/nature4.jpg',
          tags: ['Nature', 'Forest'],
          description: 'Immerse in warm autumn foliage.',
          category: 'Nature',
        ),
        WallpaperModel(
          id: 'nature_5',
          title: 'Nature 5',
          image: 'assets/nature5.jpg',
          tags: ['Nature', 'Forest'],
          description: 'Immerse in warm autumn foliage.',
          category: 'Nature',
        ),
        WallpaperModel(
          id: 'nature_6',
          title: 'Nature 6',
          image: 'assets/nature6.jpg',
          tags: ['Nature', 'Forest'],
          description: 'Immerse in warm autumn foliage.',
          category: 'Nature',
        ),
      ],
    },
    {
      'title': 'Abstract',
      'subtitle': 'Geometric and artistic',
      'count': 2,
      'image': 'assets/abstract.jpg',
      'wallpapers': [
        WallpaperModel(
          id: 'abstract_1',
          title: 'Abstract 1',
          image: 'assets/abstract1.jpg',
          tags: ['Abstract', 'Art'],
          description: 'Colorful abstract 1.',
          category: 'Abstract', // Added category
        ),
        WallpaperModel(
          id: 'abstract_2',
          title: 'Abstract 2',
          image: 'assets/abstract2.jpg',
          tags: ['Abstract', 'Shapes'],
          description: 'Creative shapes abstract 2.',
          category: 'Abstract',
        ),
      ],
    },
    {
      'title': 'Space',
      'subtitle': 'Cosmos,planets and galaxies',
      'count': 2,
      'image': 'assets/space.jpg',
      'wallpapers': [
        WallpaperModel(
          id: 'space_1',
          title: 'Space 1',
          image: 'assets/space.jpg',
          tags: ['Abstract', 'Art'],
          description: 'Colorful abstract 1.',
          category: 'Space', // Added category
        ),
        WallpaperModel(
          id: 'space_2',
          title: 'Space 2',
          image: 'assets/space.jpg',
          tags: ['Abstract', 'Shapes'],
          description: 'Creative shapes abstract 2.',
          category: 'Space',
        ),
      ],
    },
    {
      'title': 'Urban',
      'subtitle': 'Cities architecture and street',
      'count': 2,
      'image': 'assets/urban.jpg',
      'wallpapers': [
        WallpaperModel(
          id: 'urban_1',
          title: 'Urban 1',
          image: 'assets/urban.jpg',
          tags: ['Abstract', 'Art'],
          description: 'Colorful abstract 1.',
          category: 'Urban', // Added category
        ),
        WallpaperModel(
          id: 'urban_2',
          title: 'Urban 2',
          image: 'assets/urban.jpg',
          tags: ['Abstract', 'Shapes'],
          description: 'Creative shapes abstract 2.',
          category: 'Urban',
        ),
      ],
    },
    {
      'title': 'Minimalist',
      'subtitle': 'Clean, simple and elegant',
      'count': 2,
      'image': 'assets/minimalist.jpg',
      'wallpapers': [
        WallpaperModel(
          id: 'minimalist_1',
          title: 'Minimalist 1',
          image: 'assets/abstract1.jpg',
          tags: ['Abstract', 'Art'],
          description: 'Colorful abstract 1.',
          category: 'Minimalist', // Added category
        ),
        WallpaperModel(
          id: 'minimalist_2',
          title: 'Minimalist 2',
          image: 'assets/abstract2.jpg',
          tags: ['Abstract', 'Shapes'],
          description: 'Creative shapes abstract 2.',
          category: 'Minimalist',
        ),
      ],
    },
    {
      'title': 'Animal',
      'subtitle': 'Wildlife and nature photography',
      'count': 2,
      'image': 'assets/animal.jpg',
      'wallpapers': [
        WallpaperModel(
          id: 'animal_1',
          title: 'Animal 1',
          image: 'assets/animal.jpg',
          tags: ['Nature', 'Wildlife'],
          description: 'Colorful abstract 1.',
          category: 'Animal', // Added category
        ),
        WallpaperModel(
          id: 'animal_2',
          title: 'Animal 2',
          image: 'assets/animal2.jpg',
          tags: ['Nature', 'Shapes'],
          description: 'Creative shapes abstract 2.',
          category: 'Animal',
        ),
      ],
    },
  ];
});

// lib/providers/preview_drawer_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../pages/preview_page.dart'; // For Wallpaper class
import 'package:flutter_svg/flutter_svg.dart';

final previewDrawerProvider =
    StateNotifierProvider<PreviewDrawerController, bool>(
        (ref) => PreviewDrawerController());

class PreviewDrawerController extends StateNotifier<bool> {
  PreviewDrawerController() : super(false);

  void open() => state = true;
  void close() => state = false;
  void toggle() => state = !state;
}

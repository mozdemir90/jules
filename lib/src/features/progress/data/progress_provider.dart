import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'progress_provider.g.dart';

@riverpod
class ProgressController extends _$ProgressController {
  static const _completedCategoriesKey = 'completed_categories';

  @override
  Set<String> build() {
    _loadProgress();
    return {};
  }

  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    final completed = prefs.getStringList(_completedCategoriesKey) ?? [];
    state = completed.toSet();
  }

  Future<void> markCategoryCompleted(String categoryName) async {
    if (!state.contains(categoryName)) {
      final newState = {...state, categoryName};
      state = newState;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_completedCategoriesKey, newState.toList());
    }
  }

  bool isCategoryCompleted(String categoryName) {
    return state.contains(categoryName);
  }
}

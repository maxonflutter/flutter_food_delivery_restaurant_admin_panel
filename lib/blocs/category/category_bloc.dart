import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_food_delivery_backend/models/models.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryLoading()) {
    on<LoadCategories>(_onLoadCategories);
    on<SelectCategory>(_onSelectCategory);
    on<SortCategories>(_onSortCategories);
  }

  void _onLoadCategories(
    LoadCategories event,
    Emitter<CategoryState> emit,
  ) async {
    await Future<void>.delayed(
      const Duration(seconds: 1),
    );
    emit(CategoryLoaded(categories: event.categories));
  }

  void _onSelectCategory(
    SelectCategory event,
    Emitter<CategoryState> emit,
  ) async {
    final state = this.state as CategoryLoaded;

    emit(
      CategoryLoaded(
        categories: state.categories,
        selectedCategory: event.category,
      ),
    );
  }

  void _onSortCategories(
    SortCategories event,
    Emitter<CategoryState> emit,
  ) async {
    final state = this.state as CategoryLoaded;
    emit(CategoryLoading());
    await Future<void>.delayed(const Duration(seconds: 1));

    int newIndex =
        (event.newIndex > event.oldIndex) ? event.newIndex - 1 : event.newIndex;

    try {
      Category selectedCategory = state.categories[event.oldIndex];

      List<Category> sortedCategories = List.from(state.categories)
        ..remove(selectedCategory)
        ..insert(newIndex, selectedCategory);

      emit(
        CategoryLoaded(categories: sortedCategories),
      );
    } catch (_) {}
  }
}

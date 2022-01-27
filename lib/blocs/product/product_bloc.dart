import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/blocs/blocs.dart';
import '/models/models.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final CategoryBloc _categoryBloc;
  StreamSubscription? _categorySubscription;

  ProductBloc({required CategoryBloc categoryBloc})
      : _categoryBloc = categoryBloc,
        super(ProductLoading()) {
    on<LoadProducts>(_onLoadProducts);
    on<UpdateProducts>(_onUpdateProducts);
    on<SortProducts>(_onSortProducts);

    _categorySubscription = _categoryBloc.stream.listen((state) {
      if ((state as CategoryLoaded).selectedCategory == null) {
      } else {
        add(
          UpdateProducts(
            category: (state.selectedCategory!),
          ),
        );
      }
    });
  }

  void _onLoadProducts(
    LoadProducts event,
    Emitter<ProductState> emit,
  ) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    emit(ProductLoaded(products: event.products));
  }

  void _onUpdateProducts(
    UpdateProducts event,
    Emitter<ProductState> emit,
  ) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    List<Product> filteredProducts = Product.products
        .where((product) => product.category == event.category.name)
        .toList();

    emit(ProductLoaded(products: filteredProducts));
  }

  void _onSortProducts(
    SortProducts event,
    Emitter<ProductState> emit,
  ) {
    final state = this.state;

    int newIndex =
        (event.newIndex > event.oldIndex) ? event.newIndex - 1 : event.newIndex;

    if (state is ProductLoaded) {
      Product selectedProduct = state.products[event.oldIndex];

      List<Product> sortedProducts = List.from(state.products)
        ..remove(selectedProduct)
        ..insert(newIndex, selectedProduct);

      emit(
        ProductLoaded(products: sortedProducts),
      );
    }
  }

  @override
  Future<void> close() async {
    _categorySubscription?.cancel();
    super.close();
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pakmart/Model/CategoryModel.dart';
import 'package:pakmart/Model/ProductModel.dart';
import 'package:pakmart/SellerCentral/bloc/productBloc/product_state.dart';
import 'package:pakmart/SellerCentral/repository/product/product_repository.dart';
import 'package:pakmart/SellerCentral/utils/enums.dart';
import 'package:pakmart/screens/HomeScreen/widgets/categories.dart';

part 'product_event.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository productRepository;
  ProductBloc({required this.productRepository}) : super(const ProductState()) {
    on<FetchSellerProductsEvent>(_fetchSellerProductsEvent);
    on<DeleteSellerProductEvent>(_deleteSellerProduct);
  }

  void _fetchSellerProductsEvent(
      FetchSellerProductsEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(getApiStatus: GetApiStatus.loading));

    await productRepository.fetchSellerProducts().then(
      (List<Product> products) {
        emit(
          state.copyWith(
              listSellerProducts: products,
              getApiStatus: GetApiStatus.completed),
        );
      },
    ).onError(
      (error, stackTrace) {
        emit(state.copyWith(getApiStatus: GetApiStatus.error));
      },
    );
  }

  void _deleteSellerProduct(
      DeleteSellerProductEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(deleteApiStatus: DeleteApiStatus.inital));

    await productRepository.deleteSellerProductById(event.productId).then(
          (value) {},
        );
  }
}

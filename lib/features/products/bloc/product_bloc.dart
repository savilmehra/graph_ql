import 'package:clean_framework/clean_framework.dart';

import '../model/product_vm.dart';
import 'product_usecase.dart';

class ProductBloc extends Bloc {
  late final ProductUseCase _useCase;

  final countryVmPipe = Pipe<ProductViewModel>();

  @override
  void dispose() {
    countryVmPipe.dispose();
  }

  ProductBloc() {
    _useCase = ProductUseCase(countryVmPipe.send);
    countryVmPipe.whenListenedDo(_useCase.execute);
  }
}

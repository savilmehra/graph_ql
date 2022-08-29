import 'package:clean_framework/clean_framework.dart';

import '../model/cart_vm.dart';
import 'cart_usecase.dart';

class CartBloc extends Bloc {
  late final CartUseCase _useCase;

  final countryVmPipe = Pipe<CartViewModel>();

  @override
  void dispose() {
    countryVmPipe.dispose();
  }

  CartBloc() {
    _useCase = CartUseCase(countryVmPipe.send);
    countryVmPipe.whenListenedDo(_useCase.executeMutation);
  }
}

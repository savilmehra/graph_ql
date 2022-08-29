
import 'package:clean_framework/clean_framework.dart';
import 'package:graph_ql/config/graphql/graph_ql_service.dart';


import '../../../locator_gl.dart';
import '../model/cart_entity.dart';
import '../model/cart_vm.dart';
import 'cart_adapter.dart';


class CartUseCase extends UseCase {
  late final ViewModelCallback<CartViewModel> _viewModelCallBack;
  CartUseCase(  this._viewModelCallBack);
  var scope;


  void executeMutation() async {
    scope = LocatorMain().repository.create<CartEntity>(CartEntity(), _notifySubscribers);
    await LocatorMain().repository.runServiceAdapter(scope, CartAdapter(RequestType.mutation));
  }
  void _notifySubscribers(entity) {
    entity= LocatorMain()
        .repository.get(scope);
    _viewModelCallBack(buildViewModel(entity));
  }
  CartViewModel buildViewModel(CartEntity entity) {
    return CartViewModel(
      data: entity.data,

    );
  }
}

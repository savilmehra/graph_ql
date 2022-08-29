
import 'package:clean_framework/clean_framework.dart';
import 'package:graph_ql/config/graphql/graph_ql_service.dart';


import '../../../locator_gl.dart';
import '../model/product_entity.dart';
import '../model/product_vm.dart';
import 'product_adapter.dart';


class ProductUseCase extends UseCase {
  late final ViewModelCallback<ProductViewModel> _viewModelCallBack;
  ProductUseCase(  this._viewModelCallBack);
  var scope;
  void executeGetRequest() async {
    scope = LocatorMain().repository.create<ProductEntity>(ProductEntity(), _notifySubscribers);
    await LocatorMain().repository.runServiceAdapter(scope, ProductAdapter(RequestType.get));
  }

  void executeQuery() async {
    scope = LocatorMain().repository.create<ProductEntity>(ProductEntity(), _notifySubscribers);
    await LocatorMain().repository.runServiceAdapter(scope, ProductAdapter(RequestType.query));
  }
  void _notifySubscribers(entity) {
    entity= LocatorMain()
        .repository.get(scope);
    _viewModelCallBack(buildViewModel(entity));
  }
  ProductViewModel buildViewModel(ProductEntity entity) {
    return ProductViewModel(
      data: entity.data,

    );
  }
}

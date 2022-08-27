
import 'package:clean_framework/clean_framework.dart';


import '../../../locator_gl.dart';
import '../model/country_entity.dart';
import '../model/country_vm.dart';
import 'country_serviece_adapter.dart';


class CountryUseCase extends UseCase {
  late final ViewModelCallback<CountryVm> _viewModelCallBack;
  CountryUseCase(  this._viewModelCallBack);
  var scope;
  void execute() async {
    scope = LocatorMain().repository.create<CountryEntity>(CountryEntity(), _notifySubscribers);
    await LocatorMain().repository.runServiceAdapter(scope, CountryServiceAdapter());
  }
  void _notifySubscribers(entity) {
    entity= LocatorMain()
        .repository.get(scope);
    _viewModelCallBack(buildViewModel(entity));
  }
  CountryVm buildViewModel(CountryEntity entity) {
    return CountryVm(
      data: entity.data,

    );
  }
}

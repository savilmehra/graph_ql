import 'package:clean_framework/clean_framework.dart';

import '../model/country_vm.dart';
import 'country_usecase.dart';

class CountryBloc extends Bloc {
  late final CountryUseCase _useCase;

  final countryVmPipe = Pipe<CountryVm>();

  @override
  void dispose() {
    countryVmPipe.dispose();
  }

  CountryBloc() {
    _useCase = CountryUseCase(countryVmPipe.send);
    countryVmPipe.whenListenedDo(_useCase.execute);
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql_flutter/graphql_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import 'bloc/cubits/product_cubit.dart' as _i5;
import 'data/data_source.dart' as _i4;
import 'module/injectable_module.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.GraphQLClient>(() => injectableModule.client);
  gh.factory<_i4.DataSource>(() => _i4.DataSource(get<_i3.GraphQLClient>()));
  gh.factory<_i5.ProductCubit>(() => _i5.ProductCubit(get<_i4.DataSource>()));
  return get;
}

class _$InjectableModule extends _i6.InjectableModule {}

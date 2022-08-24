
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:injectable/injectable.dart';
import '../../data/data_source.dart';
import '../states/main_state.dart';
import '../states/states.dart';

@injectable
class ProductCubit extends Cubit<MainState> {
  final DataSource dataSource;

  ProductCubit(this.dataSource) : super(LoadingState());

  Future<void> getProducts({
    required String query,
    required int first,
    required String channel,
  }) async {

    var data = await dataSource.call(query: query, first: first, channel: channel);
    if (data == null) {
      emit(Empty());
    } else {
      emit(Loaded(data: data));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spacex/model/spacex_model.dart';
import 'package:spacex/services/services.dart';

part 'spacex_event.dart';
part 'spacex_state.dart';

class SpacexBloc extends Bloc<SpacexEvent, SpacexState> {
  final SpacexService _services;

  SpacexBloc(this._services) : super(SpacexLoading()) {
    on<SpacexLoadEvent>((event, emit) async {
      emit(SpacexLoading());
      try {
        final model = await _services.getLatestData();
        emit(SpacexLoaded(model));
      } catch (e) {
        emit(SpacexError(e.toString()));
      }
    });
  }
}

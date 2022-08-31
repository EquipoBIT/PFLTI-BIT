import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/models/models.dart';
import '/repositories/edt/edt_repository.dart';

part 'edt_event.dart';
part 'edt_state.dart';

class EdtBloc extends Bloc<EdtEvent, EdtState> {
  final EdtRepository _edtRepository;
  StreamSubscription? _edtSubscription;

  EdtBloc({required EdtRepository edtRepository})
      : _edtRepository = edtRepository,
        super(EdtLoading()) {
    on<LoadEdts>(_onLoadEdts);
    on<UpdateEdts>(_onUpdateEdts);
  }

  void _onLoadEdts(
    LoadEdts event,
    Emitter<EdtState> emit,
  ) {
    _edtSubscription?.cancel();
    _edtSubscription = _edtRepository.getAllEdts().listen(
          (edts) => add(
            UpdateEdts(edts),
          ),
        );
  }

  void _onUpdateEdts(
    UpdateEdts event,
    Emitter<EdtState> emit,
  ) {
    emit(EdtLoaded(edts: event.edts));
  }
}

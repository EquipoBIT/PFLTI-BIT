import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/models/models.dart';
import '/repositories/ucurricular/ucurricular_repository.dart';

part 'ucurricular_event.dart';
part 'ucurricular_state.dart';

class UCurricularBloc extends Bloc<UCurricularEvent, UCurricularState> {
  final UCurricularRepository _ucurricularRepository;
  StreamSubscription? _ucurricularSubscription;

  UCurricularBloc({required UCurricularRepository ucurricularRepository})
      : _ucurricularRepository = ucurricularRepository,
        super(UCurricularLoading()) {
    on<LoadUCurriculares>(_onLoadUCurriculares);
    on<UpdateUCurriculares>(_onUpdateUCurriculares);
  }

  void _onLoadUCurriculares(
    LoadUCurriculares event,
    Emitter<UCurricularState> emit,
  ) {
    _ucurricularSubscription?.cancel();
    _ucurricularSubscription =
        _ucurricularRepository.getAllUCurriculares().listen(
              (ucurriculares) => add(
                UpdateUCurriculares(ucurriculares),
              ),
            );
  }

  void _onUpdateUCurriculares(
    UpdateUCurriculares event,
    Emitter<UCurricularState> emit,
  ) {
    emit(
      UCurricularLoaded(ucurriculares: event.ucurriculares),
    );
  }
}

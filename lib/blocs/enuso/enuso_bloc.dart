import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:pfltibit/repositories/local_storage/local_storage_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/models/models.dart';

part 'enuso_event.dart';
part 'enuso_state.dart';

class EnUsoBloc extends Bloc<EnUsoEvent, EnUsoState> {
  final LocalStorageRepository _localStorageRepository;

  EnUsoBloc({required LocalStorageRepository localStorageRepository})
      : _localStorageRepository = localStorageRepository,
        super(EnUsoLoading()) {
    on<StartEnUso>(_onStartEnUso);
    on<AddEdtToEnUso>(_onAddEdtToEnUso);
    on<RemoveEdtFromEnUso>(_onRemoveEdtFromEnUso);
  }

  void _onStartEnUso(
    StartEnUso event,
    Emitter<EnUsoState> emit,
  ) async {
    emit(EnUsoLoading());
    try {
      Box box = await _localStorageRepository.openBox();
      List<Edt> edts = _localStorageRepository.getEnUso(box);
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(
        EnUsoLoaded(
          enuso: EnUso(edts: edts),
        ),
      );
    } catch (_) {
      emit(EnUsoError());
    }
  }

  void _onAddEdtToEnUso(
    AddEdtToEnUso event,
    Emitter<EnUsoState> emit,
  ) async {
    if (this.state is EnUsoLoaded) {
      try {
        Box box = await _localStorageRepository.openBox();
        _localStorageRepository.addEdtToEnUso(box, event.edt);

        emit(
          EnUsoLoaded(
            enuso: EnUso(
              edts: List.from((this.state as EnUsoLoaded).enuso.edts)
                ..add(event.edt),
            ),
          ),
        );
      } on Exception {
        emit(EnUsoError());
      }
    }
  }

  void _onRemoveEdtFromEnUso(
    RemoveEdtFromEnUso event,
    Emitter<EnUsoState> emit,
  ) async {
    if (this.state is EnUsoLoaded) {
      try {
        Box box = await _localStorageRepository.openBox();
        _localStorageRepository.removeEdtFromEnUso(box, event.edt);

        emit(
          EnUsoLoaded(
            enuso: EnUso(
              edts: List.from((this.state as EnUsoLoaded).enuso.edts)
                ..remove(event.edt),
            ),
          ),
        );
      } on Exception {
        emit(EnUsoError());
      }
    }
  }
}

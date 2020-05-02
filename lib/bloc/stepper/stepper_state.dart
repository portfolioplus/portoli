import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class StepperState extends Equatable {
  final int step;
  final int maxSteps;

  StepperState({
    @required this.step,
    @required this.maxSteps,
  });

  StepperState copyWith({int step, int maxSteps}) {
    return StepperState(
      step: step ?? this.step,
      maxSteps: maxSteps ?? this.maxSteps,
    );
  }

  @override
  String toString() => 'StepperState { step: $step, maxSteps: $maxSteps }';

  @override
  List<Object> get props => [step, maxSteps];
}

class StateChangeEmail extends StepperState {
  final String email;

  StateChangeEmail(this.email);

  @override
  String toString() => 'StateChangeEmail';
  @override
  List<Object> get props => [email];
}




class NoChange extends StepperState {
  @override
  String toString() => 'NoChange';
  @override
  List<Object> get props => [];
}
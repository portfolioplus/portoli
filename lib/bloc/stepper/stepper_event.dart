import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:form_bloc/form_bloc.dart';

abstract class StepperEvent extends Equatable {
  const StepperEvent();
}

class StepTapped extends StepperEvent {
  final int step;

  StepTapped({@required this.step});

  @override
  String toString() => 'StepTapped { step: $step }';

  @override
  List<Object> get props => [step];
}


class StepCancelled extends StepperEvent {
  @override
  String toString() => 'StepCancelled';
  @override
  List<Object> get props => [];
}

class StepContinue extends StepperEvent {
  @override
  String toString() => 'StepContinue';
  @override
  List<Object> get props => [];
}


class EventChangeEmail extends StepperEvent {
  final String email;

  EventChangeEmail(this.email);

  @override
  String toString() => 'EventChangeEmail';
  @override
  List<Object> get props => [email];
}

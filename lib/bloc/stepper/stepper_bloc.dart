import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portoli/bloc/stepper/stepper_event.dart';
import 'package:portoli/bloc/stepper/stepper_state.dart';
import 'package:portoli/login/user_repository.dart';

class StepperDeleteUserBloc extends Bloc<StepperEvent, StepperState> {
  final int maxSteps;
  final UserRepository userRepository;

  StepperDeleteUserBloc({@required this.maxSteps, @required this.userRepository});

  @override
  StepperState get initialState => StepperState(step: 0, maxSteps: maxSteps);

  @override
  Stream<StepperState> mapEventToState(StepperEvent event) async* {
    if (event is StepTapped) {
      yield state.copyWith(step: event.step);
    } else if (event is StepCancelled) {
      yield state.copyWith(
        step: state.step - 1 >= 0 ? state.step - 1 : 0,
      );
    } else if (event is StepContinue) {
      yield state.copyWith(
        step: state.step + 1 < maxSteps ? state.step + 1 : 0,
      );
    } 
  }
}

class StepperChangeProfileBloc extends Bloc<StepperEvent, StepperState> {
  final int maxSteps;
  final UserRepository userRepository;

  StepperChangeProfileBloc({@required this.maxSteps, @required this.userRepository});

  @override
  StepperState get initialState => StepperState(step: 0, maxSteps: maxSteps);

  @override
  Stream<StepperState> mapEventToState(StepperEvent event) async* {
    if (event is StepTapped) {
      yield state.copyWith(step: event.step);
    } else if (event is StepCancelled) {
      yield state.copyWith(
        step: state.step - 1 >= 0 ? state.step - 1 : 0,
      );
    } else if (event is StepContinue) {
      yield state.copyWith(
        step: state.step + 1 < maxSteps ? state.step + 1 : 0,
      );
    } 
  }
}

class StepperChangeEmail extends Bloc<StepperEvent, StepperState> {


  @override
  StepperState get initialState => NoChange();

  @override
  Stream<StepperState> mapEventToState(StepperEvent event) async* {
    if (event is EventChangeEmail) {
      yield StateChangeEmail(event.email);
    } 
  }
}
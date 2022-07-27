import 'package:flutter/material.dart';

enum BreathState { BREATH_IN, BREATH_OUT, HOLD }

class OnboardingProvider with ChangeNotifier {
  int _breathCounter = 3;
  BreathState breathState = BreathState.BREATH_IN;
  double _progressValue = 0;

  get getBreathCounter => _breathCounter;
  get getProgressValue {
    return _progressValue;
  }

  get getBreathState {
    if (BreathState.BREATH_IN == breathState) {
      return 'breath in';
    } else if (BreathState.BREATH_OUT == breathState) {
      return 'breath out';
    } else {
      return 'hold';
    }
  }

  setBreathCounter() {
    _breathCounter -= 1;
    notifyListeners();
  }

  setBreathState(BreathState state) {
    breathState = state;
    notifyListeners();
  }

  setProgressValue(BreathState state) {
    if (state == BreathState.BREATH_IN) {
      if(_progressValue < 1){
        _progressValue+=.01;
        notifyListeners();
      }
    }
    else if (state == BreathState.BREATH_OUT) {
      if(_progressValue > 0){
        _progressValue -= .01;
        notifyListeners();
      }
    }
  }
}

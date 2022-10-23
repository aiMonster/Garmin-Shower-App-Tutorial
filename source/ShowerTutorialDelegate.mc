import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;
import Toybox.Timer;

class ShowerTutorialDelegate extends WatchUi.BehaviorDelegate {
    private var _inProgress = false;

    private var _currentDuration;
    private var _currentCycle;

    private var _timer;
    private var _view = getView();

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onSelect() as Boolean {
        if (_inProgress == false) {
            _inProgress = true;
            startCountdown();
        }
        
        return true;
    }

    // Starts countdown
    function startCountdown() {
        _currentDuration = DataManager.getCycleDuration() - 1;
        _currentCycle = DataManager.getCyclesCount() - 1;

        _view.updateCyclesValue(_currentCycle);
        _view.setTimerValue(_currentDuration);

        _timer = new Timer.Timer();
        _timer.start(method(:updateCountdownValue), 1000, true);
    }

    function updateCountdownValue() {
        if (_currentDuration == 0 && _currentCycle == 0) {
            _timer.stop();

            return;
        }

        if(_currentDuration == 0) {
            _currentDuration = DataManager.getCycleDuration();

            _currentCycle--;
            _view.updateCyclesValue(_currentCycle);
            _view.setWaterTypeValue(_currentCycle % 2 == 0 ? WaterType.Hot : WaterType.Cold);
        }

        _currentDuration--;
        _view.setTimerValue(_currentDuration);
    }
}
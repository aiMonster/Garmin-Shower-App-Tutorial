import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;
import Toybox.Timer;

class ShowerTutorialDelegate extends WatchUi.BehaviorDelegate {
    private static var cycles = 5;
    private static var cycleDuration = 30;

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
        _currentDuration = cycleDuration;

        _timer = new Timer.Timer();
        _timer.start(method(:updateCountdownValue), 1000, true);
    }

    function updateCountdownValue() {
        if (_currentDuration == 0) {
            _timer.stop();
        }

        _view.setTimerValue(_currentDuration);
        _currentDuration--;
    }
}
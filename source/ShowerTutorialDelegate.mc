import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;

class ShowerTutorialDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onSelect() as Void {
        System.println("Selected");
    }
}
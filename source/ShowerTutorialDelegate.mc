import Toybox.Lang;
import Toybox.WatchUi;

class ShowerTutorialDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new ShowerTutorialMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}
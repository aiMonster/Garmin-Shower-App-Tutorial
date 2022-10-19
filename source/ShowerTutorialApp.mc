import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class ShowerTutorialApp extends Application.AppBase {
    private var _view;

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        _view = new ShowerTutorialView();
        return [ _view, new ShowerTutorialDelegate() ] as Array<Views or InputDelegates>;
    }

    // Returns main view instance
    function getView() as Void {
        return _view;
    }
}

function getApp() as ShowerTutorialApp {
    return Application.getApp() as ShowerTutorialApp;
}

// Returns main view instance
function getView() as ShowerTutorialView {
    return Application.getApp().getView();
}
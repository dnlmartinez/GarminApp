import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

using Toybox.Application as App;
using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;

class MahleApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function onStart(state){
        //! onStart() is called on application start up
    }
    
    function onStop(state){
        //! onStop() is called when your application is exiting
    }

    function getInitialView() {
        //! Return the initial view of your application here
        return [ new DataFieldView() ];
    }
    
    function onSettingsChanged() {
        //! New app settings have been received so trigger a UI update
        Ui.requestUpdate();
    }

    function onKeyPressed(keyEvent){

    }

}

function getApp() as MahleApp {
    return Application.getApp() as MahleApp;
}
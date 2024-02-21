import Toybox.Activity;
import Toybox.Lang;
import Toybox.AntPlus;
import Toybox.Time;
import Toybox.WatchUi;

using Toybox.AntPlus; // Importa el paquete de ANT
using Toybox.Position; // Importa el paquete de GPS
using Toybox.System; // Importa el paquete de GPS


class MahleView extends WatchUi.View {

    var latitudeField;
    var longitudeField;
    var altitudeField;

    // Set the label of the data field here.
    function initialize() {
        WatchUi.View.initialize();
        setupLayout();
        //Position.enableLocationEvents(Position.LOCATION_ONE_SHOT, method(:onPosition));
    }

    function setupLayout(){
        latitudeField = View.findDrawableById("LatitudeLabel") as Text;
        latitudeField.setText("Latitude:");
    }

    function onPosition(info) {
        
        var myLocation = info.position.toDegrees();
        var myAltitude = info.altitude.toDouble();

        System.println("Latitude: " + myLocation[0]);
        System.println("Longitude: " + myLocation[1]);
        System.println("Altitud: " + myAltitude);

        latitudeField.setText(myLocation[0]);
    }

}
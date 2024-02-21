import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.AntPlus;

using Toybox.Application as App;
using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;
using Toybox.AntPlus as Ap;

class DataFieldView extends Ui.View {

    hidden enum { SPEED,CADENCE,POWER,TEMP,HR }

    hidden var batteryVoltage as AntPlus.BatteryStatusValue or Null;

    hidden var numFields = 5;
    hidden var cadence = "0";
    hidden var speed = "0";
    hidden var power = "0";

    hidden var bikePowerObj;
    hidden var bikePowerLisener;
    
    function initialize() {
        View.initialize();
        bikePowerLisener = new MyBikePowerListener();
        bikePowerObj = new Ap.BikePower(bikePowerLisener);
    }

    function onLayout( dc ) {
        updateLayout( dc );
    }

    hidden function updateLayout( dc ) {
        setLayout( Rez.Layouts.DataFieldsEdge530( dc ) );
    }

    function onShow() {
        System.println("on onAppear");
    }

    function onHide() {
        System.println("on DisAppear");
    }

    function onBikeCadenceUpdate(data){
        cadence = data.cadence.toString();
        System.println("New Cadence value: " + cadence);
    }

    function onBikeSpeedUpdate(data){
        speed = data.speed.toString();
        System.println("New Speed value: " + speed);
    }

    function onCalculatedPowerUpdate(data){
        power = data.power.toString();
        System.println("New Power value: " + power);

        power = batteryVoltage.toString();
        System.println("New BatteryStatus Power value: " + power);
    }

    function onPedalPowerBalanceUpdate(data){
        var pedal = data.pedalPowerPercent.toString();
        System.println("New Pedal Power Balance value: " + pedal);
    }

    function onTorqueEffectivenessPedalSmoothnessUpdate(data){
        var torque = data.TorqueEffectivenessPedalSmoothness.value.toString();
        System.println("New Pedal Torque Effectiveness value: " + torque);
    }

    function onUpdate( dc ) {
        
        for( var i = 0; i < numFields; i++ ){
            var fieldNum = "DataField" + (i + 1).toString();
            var type = App.getApp().getProperty( fieldNum );
            var label = View.findDrawableById( fieldNum + "Lbl" ) as Text;
            var text = View.findDrawableById( fieldNum + "Val" ) as Text;

            switch (type) {
                case SPEED:
                    label.setText( "Speed" );    
                    text.setText( speed );
                    break;
                case CADENCE:
                    label.setText( "Cadence" );
                    text.setText( cadence );
                    break;
                case POWER:
                    label.setText( "Power" );
                    text.setText( power );
                    
                    bikePowerObj.getCalculatedPower();
                    System.println(bikePowerLisener.power.toString());
                    
                    break;
                case TEMP:
                    label.setText( "Temperature" );
                    text.setText( "0" );
                    break;
                case HR:
                    label.setText( "Heart Rate" );
                    text.setText( "0" );
                    break;
            }
            
        }
        View.onUpdate( dc );
    }

}
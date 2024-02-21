import Toybox.AntPlus;
import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

using Toybox.Application as App;
using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;
using Toybox.AntPlus;
using Toybox.System;

class MyBikePowerListener extends AntPlus.BikePowerListener {

    hidden enum {
        ITEM_POWER,
        ITEM_DISTANCE,
        ITEM_SPEED
    }

    hidden const INDICATOR_HEIGHT_DISTANCE = 130;
    hidden const INDICATOR_HEIGHT_POWER = 100;
    hidden const INDICATOR_HEIGHT_SPEED = 160;

    var power = 0;
    var distance = 0;
    var speed = 0;

    //! Initializes class variables
    function initialize() {
        BikePowerListener.initialize();
    }

    //! Sets the isPowerUpdated boolean to true
    //! Allows view to know an update has been received
    //! Takes a data parameter which is the CalculatedPower object that has been
    //! modified
    function onCalculatedPowerUpdate(data) {

        power = data.power;
        System.println("POWER:" + power.toString());
    }

    //! Sets the isDistanceUpdated boolean to true
    //! Allows view to know an update has been received
    //! Takes a data parameter which is the CalculatedWheelDistance object that
    //! has been modified
    function onCalculatedWheelDistanceUpdate(data) {
        distance = data.distance;
        System.println("DISTANCE:" + distance.toString());
    }

    //! Sets the isSpeedUpdated boolean to true
    //! Allows view to know an update has been received
    //! Takes a data parameter which is the CalculatedWheelSpeed object that has
    //! been modified
    function onCalculatedSpeedUpdate(data) {
        speed = data.speed;
        System.println("SPEED:" + speed.toString());
    }
}
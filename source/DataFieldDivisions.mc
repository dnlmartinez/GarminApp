import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

using Toybox.Application as App;
using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;

class DataFieldDivisions extends Ui.Drawable {

    var buttonX = 0;
    var buttonY_down = 0;
    var buttonY_up = 10;
    var buttonWidth = 50;
    var buttonHeight = 40;

    function initialize() {
        Drawable.initialize( { :identifier => "DataFieldDivisions" } );
    }

    function draw( dc ){
        //!  Set the theme colors then clear the screen
        dc.setColor( Gfx.COLOR_LT_GRAY, Gfx.COLOR_WHITE );
        dc.clear();
        dc.setPenWidth(1);
        
        dc.drawLine( 0, 80, dc.getWidth(), 80 );
        dc.drawLine( 0, 140, dc.getWidth(), 140 );
        dc.drawLine( 0, 200, dc.getWidth(), 200 );
        dc.drawLine( 0, 260, dc.getWidth(), 260 );
        dc.drawLine( 0, 320, dc.getWidth(), 320 );

        dc.setColor( Gfx.COLOR_LT_GRAY, Gfx.COLOR_WHITE );
        dc.setPenWidth(68);
        dc.drawLine( dc.getWidth() - 34 , 0, dc.getWidth() - 34, dc.getHeight() );

        dc.setColor( Gfx.COLOR_DK_BLUE, Gfx.COLOR_LT_GRAY );
        dc.setPenWidth(2);

        buttonX = dc.getWidth() - 60;
        buttonY_down = dc.getHeight() - 50;

        dc.fillRoundedRectangle(buttonX, buttonY_up, buttonWidth, buttonHeight, 6);
        dc.fillRoundedRectangle(buttonX, buttonY_down, buttonWidth, buttonHeight, 6);
    }

    function onSelectable(selectableEvent){
         System.println("Tap");
    /*
    // Maneja el evento de toque en la pantalla
        if (clickEvent.action == WatchUi.TouchAction.Tap) {
            if (clickEvent.x >= buttonX && clickEvent.x <= buttonX + buttonWidth && clickEvent.y >= buttonY_up && clickEvent.y <= buttonY_up + buttonHeight) {
                buttonPressedUp();
            }
            else if (clickEvent.x >= buttonX && clickEvent.x <= buttonX + buttonWidth && clickEvent.y >= buttonY_down && clickEvent.y <= buttonY_down + buttonHeight) {
                buttonPressedDown();
            } 
        }
    */
    }

    function buttonPressedUp(){
        // Acción a realizar cuando se presiona el botón Up
        System.println("Button pressed Up");
    }

    function buttonPressedDown(){
        // Acción a realizar cuando se presiona el botón Down
        System.println("Button pressed Down");
    }



}
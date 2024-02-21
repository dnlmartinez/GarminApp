import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

using Toybox.Application as App;
using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;

class MahleButtonSmall extends Ui.Drawable {

    hidden var mColor;
    hidden var mText; // or icon stuff
    hidden var mFont;

    function initialize(params) {
        Drawable.initialize(params);
        mColor = params[:color];
        mText = params[:text];
        mFont = params[:font];
    }

    function setColor(color) {
        mColor = color;
    }

    function setText(text) {
        mText = text;
    }

    function setFont(font) {
        mFont = font;
    }

    function draw(dc) {
        dc.setColor(mColor, mColor);
        dc.fillRectangle(locX, locY, width, height);
        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        dc.drawRectangle(locX, locY, width, height);
        dc.drawText(locX + width / 2, locY + height / 2, mFont, mText, Gfx.TEXT_JUSTIFY_CENTER | Gfx.TEXT_JUSTIFY_VCENTER);
    }

}
/**
 * Created by varadig on 29/08/14.
 */
package base {
import com.greensock.TimelineLite;

import core.base.CoreBaseSprite;
import core.notification.CoreNotificationContainer;

import flash.display.DisplayObject;
import flash.events.Event;

import layers.ClickLayer;

public class CoreBaseBanner extends CoreBaseSprite {
    public function CoreBaseBanner() {
        super();
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    protected var bannerType:String;
    protected var timeline:TimelineLite;
    protected var clickLayer:ClickLayer;

    protected function initialize():void {

        this.timeline = new TimelineLite();
        this.clickLayer = new ClickLayer();
        this.clickLayer.bannerType = this.bannerType;
    }

    protected function build():void {
        //abstract method
    }

    protected function resume():void {
        this.timeline.resume();
    }

    protected function pause():void {
        this.timeline.pause();
    }

    protected function addClickLayerOver(displayObject:DisplayObject):void {
        try {
            this.addChildAt(this.clickLayer, this.getChildIndex(displayObject) + 1);
        }
        catch (error:Error) {
            trace(error);
        }
    }

    protected function addClickLayerUnder(displayObject:DisplayObject):void {
        try {
            this.addChildAt(this.clickLayer, this.getChildIndex(displayObject) - 1);
        }
        catch (error:Error) {
            trace(error);
        }
    }

    private function onAddedToStage(event:Event):void {
        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        this.initialize();
    }
}
}

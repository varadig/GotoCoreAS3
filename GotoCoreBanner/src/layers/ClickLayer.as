/**
 * Created by varadig on 29/08/14.
 */
package layers {
import bannertypes.BannerTypes;

import core.base.CoreBaseSprite;

import flash.events.Event;
import flash.events.MouseEvent;
import flash.net.URLRequest;
import flash.net.navigateToURL;

public class ClickLayer extends CoreBaseSprite {
    public function ClickLayer() {
        this.initialize();
    }

    public var bannerType:String;

    private function initialize():void {

        this.graphics.beginFill(0xFF00FF);
        this.graphics.drawRect(0, 0, 10, 10);
        this.graphics.endFill();
        this.addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
    }

    protected function onClicked(event:MouseEvent):void {
        switch (this.bannerType) {
            case BannerTypes.GOOGLE:
                navigateToURL(new URLRequest(root.loaderInfo.parameters.clickTAG), "_blank");
                break;
            case BannerTypes.ADVERTICUM:
                navigateToURL(new URLRequest(root.loaderInfo.parameters.clickTag), "_blank");
                break;
        }
    }

    private function onAddedToStage(event:Event):void {
        log("click layer added to:" + this.parent.name);
        this.removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        this.x = 0;
        this.y = 0;
        this.alpha = 1;
        this.width = this.stage.stageWidth;
        this.height = this.stage.stageHeight;
        this.addEventListener(MouseEvent.CLICK, this.onClicked);
        this.buttonMode = true;
    }
}
}

/**
 * Created by varadig on 06/12/14.
 */
package core.logger {
import core.logger.interfaces.ICoreConsole;
import core.utils.CoreUtils;

import feathers.controls.Button;
import feathers.controls.List;
import feathers.controls.ScrollText;
import feathers.data.ListCollection;
import feathers.layout.VerticalLayout;

import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

import plugins.mxml.feathers.GuiLayoutGroup;

import starling.core.Starling;
import starling.display.Quad;
import starling.events.Event;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class CoreFeathersConsole extends GuiLayoutGroup implements ICoreConsole {

    public static const CORE_FEATHERS_CONSOLE_DEFAULT_LABEL_STYLE_NAME:String = 'core.feathers.console.default.label.style.name';
    public static const CORE_FEATHERS_CONSOLE_DEFAULT_LIST_STYLE_NAME:String = 'core.feathers.console.default.list.style.name';

    private var console:List;
    private var logProvider:ListCollection = new ListCollection();
    private var touched:Boolean;
    private var closeButton:Button;


    public function CoreFeathersConsole() {
        super();
        Starling.current.nativeStage.addEventListener(KeyboardEvent.KEY_DOWN, this.onConsolKeyDown);
        this.addEventListener(TouchEvent.TOUCH, this.onConsolTouched);

        this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
    }

    private function addedToStageHandler(event:Event):void {
        this.removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
        this.closeButton = new Button();
        this.closeButton.defaultSkin = new Quad(20, 20, 0xff0000);
        this.closeButton.addEventListener(Event.TRIGGERED, triggeredHandler);
        this.console = new List();
        this.console.styleName = CORE_FEATHERS_CONSOLE_DEFAULT_LIST_STYLE_NAME;

        var lo:VerticalLayout = new VerticalLayout();
        lo.hasVariableItemDimensions = true;
        this.console.layout = lo;

        this.console.itemRendererType = ConsoleListItemRenderer;
        if (CoreUtils.isBrowser || CoreUtils.isDesktop)
            this.console.interactionMode = ScrollText.INTERACTION_MODE_MOUSE;
        else
            this.console.interactionMode = ScrollText.INTERACTION_MODE_TOUCH;


        this.console.padding = 20;
        this.console.pageThrowDuration = 10;

        this.addChild(this.console);
        this.addChild(this.closeButton);


    }


    private function onConsolKeyDown(event:KeyboardEvent):void {

        if (event.ctrlKey == true && event.keyCode == Keyboard.D)
            this.switchState();
    }

    public function appendText(message:String):void {
        this.logProvider.addItem({message: message});
        try {
            this.refreshConsolByBuffer();
            Starling.current.stage.setChildIndex(this, Starling.current.nativeStage.numChildren - 1);

        }
        catch (error:Error) {
        }

    }

    public function setAlpha(value:Number):void {
        this.alpha = value;
    }

    public function show():void {
        if (!Starling.current.stage.contains(this))
            Starling.current.stage.addChild(this);

        this.console.dataProvider = this.logProvider;


        this.width = this.console.width = Starling.current.nativeStage.stageWidth / 2;
        this.height = this.console.height = Starling.current.nativeStage.stageHeight / 2;

        this.refreshConsolByBuffer();
    }

    private function refreshConsolByBuffer():void {

        console.validate();
        while (console.verticalScrollPosition != console.maxVerticalScrollPosition) {
            console.verticalScrollPosition = console.maxVerticalScrollPosition;
            console.validate();
        }
    }

    public function hide():void {
        if (Starling.current.stage.contains(this))
            Starling.current.stage.removeChild(this);
        this.console.dataProvider = null;
    }

    public function switchState():void {
        if (Starling.current.stage.contains(this))
            this.hide();
        else
            this.show();

    }

    private function onConsolTouched(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this);
        if (!touch)
            return;
        switch (touch.phase) {
            case TouchPhase.BEGAN:
                if (touch.tapCount == 2)
                    this.touched = true;


                break;
            case TouchPhase.MOVED:
                if (!touched)
                    return;
                this.x += touch.getMovement(this).x;
                this.y += touch.getMovement(this).y;
                break;
            case TouchPhase.ENDED:
                this.touched = false;
                break;
        }

    }

    private function triggeredHandler(event:Event):void {
        this.hide();
    }
}
}

import core.logger.CoreFeathersConsole;

import feathers.layout.VerticalLayout;
import feathers.layout.VerticalLayoutData;

import plugins.mxml.feathers.GuiLabel;
import plugins.mxml.feathers.GuiLayoutGroupListItemRenderer;

class ConsoleListItemRenderer extends GuiLayoutGroupListItemRenderer {
    private var label:GuiLabel;
    private var _lo:VerticalLayout = new VerticalLayout();
    private var _lod:VerticalLayoutData = new VerticalLayoutData();

    public function ConsoleListItemRenderer():void {
        this._lo.verticalAlign = VerticalLayout.VERTICAL_ALIGN_MIDDLE;
        this._lo.horizontalAlign = VerticalLayout.HORIZONTAL_ALIGN_JUSTIFY;
        this._lod.percentWidth = 100;
        this.layoutData = _lod;

        var labelLayoutData:VerticalLayoutData = new VerticalLayoutData();
        labelLayoutData.percentWidth = 100;
        this.layout = this._lo;
        this.label = new GuiLabel();
        this.label.layoutData = labelLayoutData;
        this.label.styleName = CoreFeathersConsole.CORE_FEATHERS_CONSOLE_DEFAULT_LABEL_STYLE_NAME;
        this.label.wordWrap = true;
        this.addChild(this.label);

    }

    override public function set data(value:Object):void {
        super.data = value;
        if (!this.data)
            return;
        this.label.text = String(data.message);
    }

}

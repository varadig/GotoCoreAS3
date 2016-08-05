package core.logger.console {
import core.base.CoreBaseSprite;
import core.logger.interfaces.ICoreConsole;

import flash.display.Stage;
import flash.events.KeyboardEvent;
import flash.text.TextField;
import flash.text.TextFieldType;
import flash.ui.Keyboard;

public class CoreFlashConsole extends CoreBaseSprite implements ICoreConsole {
    //CTRL+D show the CoreConsole
    private var body:Stage;

    private var console:TextField = new TextField();

    private var defaultVisibilty:Boolean = false;

    private var defaultAlpha:Number = .8;

    public function CoreFlashConsole(body:Stage) {
        super();
        this.body = body;
        this.addConsoleTo(this.body, this.console);
    }

    private function addConsoleTo(body:Stage, console:TextField):void {

        console.width = body.stageWidth;
        console.height = body.stageHeight;
        console.type = TextFieldType.DYNAMIC;
        console.background = true;
        console.backgroundColor = 0x000000;
        this.visible = this.defaultVisibilty;
        this.addChild(console);

        this.body.addEventListener(KeyboardEvent.KEY_DOWN, this.onConsolKeyDown);
        body.addChild(this);
    }

    private function onConsolKeyDown(event:KeyboardEvent):void {

        if (event.ctrlKey == true && event.keyCode == Keyboard.D) {
            log("CoreConsole.onConsolKeyDown(event)");
            if (this.visible)
                this.switchState();
            else {
                this.switchState();
                this.toTop();
            }
        }
    }

    public function appendText(message:String):void {
        this.console.appendText(message);
    }

    public function setAlpha(value:Number):void {
        this.alpha = value;
    }

    public function show():void {

        this.visible = true;
    }

    public function hide():void {
        this.visible = false;
    }

    public function switchState():void {
        log("CoreConsole.switchState()");
        this.visible = !this.visible;
    }

    private function toTop():void {
        this.body.setChildIndex(this, this.body.numChildren - 1);
        log('this.body.numChildren: ' + (this.body.numChildren));
    }
}
}

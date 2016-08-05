/**
 * Created by varadig on 1/21/15.
 */
package core.logger {
import core.logger.base.CoreBaseLogger;
import core.logger.interfaces.ICoreConsole;

import flash.display.NativeWindow;
import flash.display.NativeWindowInitOptions;
import flash.display.Stage;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.NativeWindowBoundsEvent;
import flash.text.TextField;
import flash.ui.Keyboard;

public class CoreNativeWindowLogger extends CoreBaseLogger implements ICoreConsole {

    private var console:TextField;
    private var window:NativeWindow;
    private var body:Stage;
    private var buffer:String;

    public function CoreNativeWindowLogger(options:NativeWindowInitOptions, body:Stage) {
        this.body = body;
        this.body.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
        this.initConsole();
        this.initConsoleWindow(options);
    }

    private function initConsole():void {

        this.console = new TextField();
        this.console.backgroundColor = 0x000000;
        this.console.opaqueBackground = true;
        this.console.textColor = 0x00FF00;
    }

    private function initConsoleWindow(options:NativeWindowInitOptions):void {
        this.window = new NativeWindow(options);
        this.window.addEventListener(Event.ACTIVATE, onWindowActivated);
        this.window.addEventListener(NativeWindowBoundsEvent.RESIZE, this.onWindowResized);
    }

    private function onWindowActivated(event:Event):void {
    //    this.window.maxSize = new Point(Capabilities.screenResolutionX / 3, Capabilities.screenResolutionY / 3);
        this.window.maximize();
        if (!this.window.stage.contains(this.console))
            this.window.stage.addChild(this.console);
    }
    override protected function addLogEntry(message:String):void {
        trace("native window text add log entry");
        this.buffer +=message;
        this.console.htmlText = this.buffer;

    }

    public function appendText(entry:String):void {
    }

    public function setAlpha(value:Number):void {
    }

    public function show():void {
        if (!this.window.active)
            this.window.activate();
    }

    public function hide():void {
        if (this.window.active)
            this.window.close();
    }

    public function switchState():void {
        if (this.window.active)
            this.hide();
        else
            this.show();
    }


    private function onWindowResized(event:NativeWindowBoundsEvent):void {
        this.console.width = this.window.width;
        this.console.height = this.window.height;
    }


    private function onKeyDown(event:KeyboardEvent):void {
        if (event.ctrlKey == true && event.keyCode == Keyboard.D)
            this.switchState();
    }
}
}

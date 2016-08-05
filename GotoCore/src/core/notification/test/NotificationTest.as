package core.notification.test {
import core.base.CoreBaseSprite;
import core.logger.CoreLogger;
import core.logger.CoreLoggerDebug;
import core.logger.base.CoreBaseLogger;
import core.notification.CoreNotificationContainer;
import core.test.interfaces.IUnitTest;

import flash.display.SimpleButton;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;

public class NotificationTest extends CoreBaseSprite implements IUnitTest {

    private var addListeners:SimpleButton;
    private var removeListeners:SimpleButton;
    private var runNotification:SimpleButton;

    public function NotificationTest():void {
        this.addListeners = generateButton("ADD LISTENERS");
        this.removeListeners = generateButton("REMOVE LISTENERS");
        this.runNotification = generateButton("RUN NOTIFICATIONS");

        this.removeListeners.x = this.addListeners.width + 20;
        this.runNotification.x = this.removeListeners.x + this.removeListeners.width + 20;
        this.addChild(this.addListeners);
        this.addChild(this.removeListeners);
        this.addChild(this.runNotification);

        this.addListeners.addEventListener(MouseEvent.CLICK, clickHandler);


    }

    private function generateButton(label:String):SimpleButton {

        var button:SimpleButton = new SimpleButton();
        var sprite:Sprite = new Sprite();
        sprite.graphics.beginFill(0xFFFFFF * Math.random());
        sprite.graphics.drawRect(0, 0, 80, 30);
        var textField:TextField = new TextField();
        textField.text = label;
        sprite.addChild(textField);
        button.downState = button.overState = button.upState = sprite;
        return button;

    }

    public function run():void {
        this.initDependecies();
        new B1();
        new B2();
        new B3();
        new A1();
    }

    public function initDependecies():void {
        CoreNotificationContainer.getInstance();
        CoreLogger.getInstance(Vector.<CoreBaseLogger>([new CoreLoggerDebug()]));
    }

    private function clickHandler(event:MouseEvent):void {
    }
}
}

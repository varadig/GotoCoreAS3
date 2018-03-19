/**
 * Created by varadig on 10/31/15.
 */
package plugins.mxml.feathers {
import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.service.CoreServiceContainer;

import feathers.controls.Button;
import feathers.skins.IStyleProvider;

import starling.events.Touch;
import starling.events.TouchEvent;

public class GuiButton extends Button {
    public var sc:CoreServiceContainer;

    public var context:CoreContext;


    public var callbacks:Array = [];
    public static var globalStyleProvider:IStyleProvider;


    public function GuiButton() {
        CoreBaseClassFactory.construct(this);
        this.addEventListener(TouchEvent.TOUCH, this.touchHandler)
    }

    public function serviceAddCallback(params:Array):void {
        CoreBaseClassFactory.serviceAddCallback(this, params);
    }

    public function serviceAddCallbacks(params:Array):void {
        CoreBaseClassFactory.serviceAddCallbacks(this, params);
    }

    public function serviceRemoveCallback(params:Array):void {
        CoreBaseClassFactory.serviceRemoveCallback(this, params);
    }
    public function serviceRemoveCallbacks(params:Array):void {
        CoreBaseClassFactory.serviceRemoveCallbacks(this, params);
    }


    protected function createCallBack(group:String):CoreCallback {
        return CoreBaseClassFactory.createCallBack(this, group);
    }

    protected function log(message:Object):void {
        CoreBaseClassFactory.log(this, message);
    }


    protected function touchHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this);
        if (!touch)
            return;
        this.createCallBack(touch.phase).send();
    }
}
}



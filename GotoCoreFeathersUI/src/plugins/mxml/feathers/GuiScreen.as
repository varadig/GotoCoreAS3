/**
 * Created by varadig on 10/31/15.
 */
package plugins.mxml.feathers {
import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.service.CoreServiceContainer;

import feathers.controls.Screen;
import feathers.skins.IStyleProvider;

public class GuiScreen extends Screen {
    public var sc:CoreServiceContainer;

    public var context:CoreContext;


    public var callbacks:Array = [];
    public static var globalStyleProvider:IStyleProvider;



    public function GuiScreen() {
        CoreBaseClassFactory.construct(this);
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


}
}



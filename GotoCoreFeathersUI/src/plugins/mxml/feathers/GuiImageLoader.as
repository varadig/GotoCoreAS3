/**
 * Created by varadig on 2015. 11. 03..
 */
package plugins.mxml.feathers {

import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.service.CoreServiceContainer;

import feathers.controls.ImageLoader;

public class GuiImageLoader extends ImageLoader {

    public var sc:CoreServiceContainer;

    public var context:CoreContext;


    public var callbacks:Array = [];


    public function GuiImageLoader() {
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

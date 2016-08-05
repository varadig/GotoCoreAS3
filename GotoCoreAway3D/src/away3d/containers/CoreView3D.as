/**
 * Created by varadig on 7/30/15.
 */
package away3d.containers {
import away3d.cameras.Camera3D;
import away3d.core.render.RendererBase;

import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.service.CoreServiceContainer;

public class CoreView3D extends View3D {

    public function CoreView3D(scene:Scene3D = null, camera:Camera3D = null, renderer:RendererBase = null, forceSoftware:Boolean = false, profile:String = "baseline") {
        super(scene, camera, renderer, forceSoftware, profile);
        CoreBaseClassFactory.construct(this);
    }

    public var sc:CoreServiceContainer;
    public var context:CoreContext;
    public var callbacks:Array = [];

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


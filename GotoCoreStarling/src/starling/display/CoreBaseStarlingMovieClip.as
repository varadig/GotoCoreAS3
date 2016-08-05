/**
 * Created with IntelliJ IDEA.
 * User: varadig
 * Date: 2013.12.10.
 * Time: 16:07
 * To change this template use File | Settings | File Templates.
 */
package starling.display {
import core.base.*;
import core.context.CoreContext;
import core.service.CoreServiceContainer;

import starling.textures.Texture;

public class CoreBaseStarlingMovieClip extends MovieClip {
    public function CoreBaseStarlingMovieClip(textures:Vector.<Texture>, fps:Number = 12) {
        super(textures, fps);
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

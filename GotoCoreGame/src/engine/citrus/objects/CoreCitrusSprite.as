/**
 * Created with IntelliJ IDEA.
 * User: varadig
 * Date: 2013.12.03.
 * Time: 14:34
 * To change this template use File | Settings | File Templates.
 */
package engine.citrus.objects {
import citrus.objects.CitrusSprite;

import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.service.CoreServiceContainer;

public class CoreCitrusSprite extends CitrusSprite {
    public var sc:CoreServiceContainer;

    public var context:CoreContext;

    public var callbacks:Array = new Array();


    public function CoreCitrusSprite(name:String, params:Object = null) {
        super(name, params);
        CoreBaseClassFactory.construct(this);
    }

    public function serviceAddCallback(params:Array):void {
        CoreBaseClassFactory.serviceAddCallback(this, params);
    }

    public function serviceAddCallbacks(params:Array):void {
        CoreBaseClassFactory.serviceAddCallbacks(this, params);
    }

    protected function createCallBack(group:String):CoreCallback {
        return CoreBaseClassFactory.createCallBack(this, group);
    }

    protected function log(message:Object):void {
        CoreBaseClassFactory.log(this, message);
    }
}
}

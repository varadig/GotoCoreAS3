/**
 * Created by varadig on 1/6/15.
 */
package feathers.controls {
import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.notification.CoreNotification;
import core.service.CoreServiceContainer;

import feathers.core.FeathersControl;

public class G2CFeatherControl extends FeathersControl {
    public function G2CFeatherControl() {
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

    public function createCallBack(group:String):CoreCallback {
        return CoreBaseClassFactory.createCallBack(this, group);
    }

    protected function log(...message):void {
        CoreBaseClassFactory.log(this, message);
    }

    protected function createNotificaionByName(name:String):CoreNotification {
        return this.sc.getService(CoreNotification.CREATE_NOTIFICATION)
                .addParam(CoreNotification.NAME, name)
                .execute();
    }


}
}

/**
 * Created by varadig on 5/26/15.
 */
package feathers.controls {
import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.notification.CoreNotification;
import core.service.CoreServiceContainer;

import feathers.skins.IStyleProvider;

public class G2CFeathersStackScreenNavigator extends StackScreenNavigator {
    public static var globalStyleProvider:IStyleProvider;

    public function G2CFeathersStackScreenNavigator() {
        super();
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

    protected function createCallBack(group:String):CoreCallback {
        return CoreBaseClassFactory.createCallBack(this, group);
    }

    protected function log(message:Object):void {
        CoreBaseClassFactory.log(this, message);
    }

    protected function createNotificaionByName(name:String):CoreNotification {
        return this.sc.getService(CoreNotification.CREATE_NOTIFICATION)
                .addParam(CoreNotification.NAME, name)
                .execute();
    }

    override protected function get defaultStyleProvider():IStyleProvider {
        return G2CFeatherLayoutGroup.globalStyleProvider;
    }
}
}



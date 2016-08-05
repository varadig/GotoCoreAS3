﻿﻿package core.notification {
import core.base.CoreBaseSender;
import core.base.interfaces.IExecutable;
import core.service.CoreServiceContainer;

public class CoreNotification extends CoreBaseSender {
    public static const CREATE_NOTIFICATION:String = "create.notification";
    public static const NAME:String = "name";
    public static const BASE_NAME:String = "base.name";


    public function CoreNotification(name:String, collection:Array):void {
        super(name, collection);
    }

    override public function send():void {
        for each (var listener:IExecutable in this.collection) {
            listener.setParams(this.params).addParam(BASE_NAME, this.name).notify();
        }
    }

    public static function createNotification(name:String):CoreNotification {
        return CoreServiceContainer.getInstance().getService(CoreNotification.CREATE_NOTIFICATION)
                .addParam(CoreNotification.NAME, name)
                .execute();
    }
}
}

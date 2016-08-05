package core.context {

import core.base.CoreBaseParameterHolder;
import core.notification.CoreNotification;
import core.service.CoreServiceContainer;

import flash.display.Stage;

public class CoreContext extends CoreBaseParameterHolder {
    public static var instance:CoreContext;
    public static var stageInstance:Stage;

    public static function getInstance():CoreContext {
        if (instance == null) {
            instance = new CoreContext();
        }
        return instance;
    }

    public function CoreContext() {
        this.sc = CoreServiceContainer.getInstance();
    }

    public var sc:CoreServiceContainer;

    private var _stage:Stage;

    public function get stage():Stage {
        return _stage;
    }

    public function set stage(value:Stage):void {
        stageInstance = value;
        _stage = value;
    }

    public function getParam(name:String):Object {
        return this.params[name];
    }

    public function getString(name:String):String {
        return String(this.params[name]);
    }

    public function getInteger(name:String):int {
        return int(this.params[name]);
    }

    public function getNumber(name:String):Number {
        return Number(this.params[name]);
    }

    public function getObject(name:String, type:Class):* {
        return type(this.params[name]);
    }

    public function getParams():Array {
        return this.params;
    }

    public function setParamAndNotify(name:String, value:Object):* {
        this.params[name] = value;
        var notification:CoreNotification = this.sc.getService("create.notification").addParam("name", name).execute() as CoreNotification;
        notification.send();
        return this;
    }
}
}



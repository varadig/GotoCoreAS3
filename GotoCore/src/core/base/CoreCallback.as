package core.base {
import core.base.interfaces.IExecutable;
import core.service.CoreServiceContainer;

public class CoreCallback extends CoreBaseSender {
    public static const GROUP:String = 'group';
    public static const CALLBACK:String = 'callback';
    public static const CALLBACKS:String = 'callbacks';

    public static const ADD_CALLBACK:String = ".add.callback";
    public static const ADD_CALLBACKS:String = ".add.callbacks";

    public static const REMOVE_CALLBACKS:String = ".remove.callbacks";
    public static const REMOVE_CALLBACK:String = ".remove.callback";


    public function CoreCallback(name:String, collection:Array) {
        super(name, collection);
    }

    override public function send():void {
        for each (var service:IExecutable in this.collection) {
            service.setParams(this.params).execute();
        }
    }

    public static function addCallback(target:Object, group:String, callback:IExecutable):void {
        CoreServiceContainer.getInstance().getService(target.name + ADD_CALLBACK)
                .addParam(GROUP, group)
                .addParam(CALLBACK, callback)
                .execute();
    }

//TODO executabel helyett handler function.
    public static function addCallbacks(target:Object, group:String, callbacks:Vector.<IExecutable>):void {

        CoreServiceContainer.getInstance().getService(target.name + ADD_CALLBACKS)
                .addParam(GROUP, group)
                .addParam(CALLBACKS, callbacks)
                .execute();
    }

    public static function removeCallbacks(target:Object, group:String, callbacks:Vector.<IExecutable>):void {
        CoreServiceContainer.getInstance().getService(target.name+REMOVE_CALLBACKS)
                .addParam(GROUP,group)
                .addParam(CALLBACKS,callbacks)
                .execute();
    }
}
}

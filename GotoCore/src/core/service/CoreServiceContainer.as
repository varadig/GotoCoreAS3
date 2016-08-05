package core.service {
import core.base.interfaces.IExecutable;
import core.utils.Log;

public class CoreServiceContainer {
    private static var instance:CoreServiceContainer;

    public static function getInstance():CoreServiceContainer {
        if (CoreServiceContainer.instance == null)
            CoreServiceContainer.instance = new CoreServiceContainer();
        return CoreServiceContainer.instance;
    }

    private var mapping:Array = [];

    public function registerService(name:String, reference:Function):void {
        this.mapping[name] = reference;
    }

    public function updateService(name:String, reference:Function):void {
        if (this.mapping[name])
            this.mapping[name] = reference;
    }

    public function removeService(name:String):void {
        delete this.mapping[name];
    }

    public function getService(name:String):IExecutable {
        if (this.mapping[name] == null) {
            Log..error("Nincs ilyen service regisztrálva:  " + name);
            //ExternalInterface.call(  'alert'  ,  "Nincs ilyen service regisztrálva:  "  +  name  );
            throw new Error("Nincs ilyen service regisztrálva:  " + name);
        }

        return new CoreService(name, this.mapping[name]).addParam(CoreService.CORE_SERVICE_NAME, name);
    }

    public function chainServices(services:Vector.<IExecutable>):void {
services[0].execute();
    }

    public function hasService(name:String):Boolean {
        return (this.mapping[name] != null);
    }
}
}



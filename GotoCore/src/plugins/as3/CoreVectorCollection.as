package plugins.as3 {
import com.bealearts.collection.VectorCollection;

import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.service.CoreServiceContainer;

/**
 * @author varadig
 */
public class CoreVectorCollection extends VectorCollection {
    public var sc:CoreServiceContainer;

    public var context:CoreContext;
    public var callbacks:Array = [];
    protected static var nameIndex:int = 0;
    protected var namePrefix:String = "vectorCollection";
    private var _name:String;

    public function CoreVectorCollection(source:Object = null) {
        super(source);
        this._name = this.generateName();

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

    public function get name():String {
        return this._name as String;
    }

    private function generateName():String {
        return (this.namePrefix + CoreVectorCollection.nameIndex++) as String;
    }
}
}

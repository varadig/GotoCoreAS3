/**
 * Created by varadig on 12/25/15.
 */
package feathers.themes {
import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.service.CoreServiceContainer;

import feathers.skins.IStyleProvider;

public class GuiStyleNameFunctionTheme extends StyleNameFunctionTheme {
    protected static var nameIndex:int = 0;
    protected var namePrefix:String = "gui.style.name.function.theme";

    private var _name:String;

    public var sc:CoreServiceContainer;

    public var context:CoreContext;


    public var callbacks:Array = [];
    public static var globalStyleProvider:IStyleProvider;


    public function GuiStyleNameFunctionTheme() {
        this._name = this.generateName();

        CoreBaseClassFactory.construct(this);
    }
    public function get name():String {
        return this._name as String;
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

    private function generateName():String {
        return (this.namePrefix + GuiStyleNameFunctionTheme.nameIndex++) as String;
    }
}
}

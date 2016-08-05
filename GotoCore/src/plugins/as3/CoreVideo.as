/**
 * Created by varadig on 12/5/15.
 */
package plugins.as3 {
import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.service.CoreServiceContainer;
import core.utils.Log;

import flash.media.Video;

public class CoreVideo extends Video {
    protected static var nameIndex:int = 0;

    public function CoreVideo(width:int = 320, height:int = 240) {
        super(width, height);
        this.name = this.generateName();
        CoreBaseClassFactory.construct(this);
    }

    public var sc:CoreServiceContainer;
    public var context:CoreContext;
    public var callbacks:Array = [];
    protected var namePrefix:String = "core.video";


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

    public function createCallBack(group:String):CoreCallback {
        return CoreBaseClassFactory.createCallBack(this, group);
    }


    protected function log(...message):void {
        Log.add(message);
    }


    private function generateName():String {
        return (this.namePrefix + CoreVideo.nameIndex++) as String;
    }

}
}



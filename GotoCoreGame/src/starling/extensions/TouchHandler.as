/**
 * Created with IntelliJ IDEA.
 * User: varadig
 * Date: 2013.12.03.
 * Time: 10:05
 * To change this template use File | Settings | File Templates.
 */
package starling.extensions {
import starling.display.DisplayObject;
import starling.events.Touch;
import starling.events.TouchEvent;

public class TouchHandler {
    public function TouchHandler() {
    }


    public static function getTouch(event:TouchEvent, target:DisplayObject, phase:String = null):Touch {
        var touch:Touch = event.getTouch(target, phase);
        if (!touch)
            return null;
        return touch;
    }
}
}

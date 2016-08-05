/**
 * Created by varadig on 1/23/16.
 */
package core.utils {
import core.base.CoreBaseClass;
import core.context.CoreContext;

import flash.geom.Rectangle;
import flash.system.Capabilities;

internal class CoreScreen extends CoreBaseClass {
    public function get dimension():Rectangle {
        if (CoreUtils.isAndroid || CoreUtils.isIOS)
            return new Rectangle(0, 0, Capabilities.screenResolutionX, Capabilities.screenResolutionY);

        return new Rectangle(0, 0, CoreContext.getInstance().stage.fullScreenWidth, CoreContext.getInstance().stage.fullScreenHeight);
    }
}
}

/**
 * Created by varadig on 1/23/16.
 */
package core.utils {
import core.base.CoreBaseClass;
import core.context.CoreContext;

import flash.geom.Rectangle;

public class CoreStarlingUtils extends CoreBaseClass {
    public static var baseViewport:Rectangle;

    public static function get contentScaleFactor():Number {
        if (!baseViewport)
            throw new Error('Ypu have to setup bsaeViewport before calculate contentScaleFactor');
        return (CoreUtils.screen.dimension.width * CoreContext.getInstance().stage.contentsScaleFactor) / baseViewport.width;
    }

    public static function findScaleFactor():Number {

        var minValue:Number = Math.min(CoreContext.getInstance().stage.fullScreenWidth, CoreContext.getInstance().stage.fullScreenHeight);
        if (minValue <= 400) // iPhone3GS
            return .25; // 0.25 in TexturePacker
        else if (minValue <= 640) // Lots of Android devices
            return .5; // 0.375 in TexturePacker
        else if (minValue <= 750) // iPhone 6
            return .5; // 0.375 in TexturePacker
        return 1; // 1 in TexturePacker
    }
}
}

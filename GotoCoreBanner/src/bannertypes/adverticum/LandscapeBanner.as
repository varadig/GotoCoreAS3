/**
 * Created by varadig on 29/08/14.
 */
package bannertypes.adverticum {
import bannertypes.BannerTypes;

import base.BaseLandscapeBanner;

public class LandscapeBanner extends BaseLandscapeBanner {
    public function LandscapeBanner() {
        super();
    }
    override protected function initialize():void {
        super.initialize();
        this.bannerType = BannerTypes.ADVERTICUM;
    }
}
}

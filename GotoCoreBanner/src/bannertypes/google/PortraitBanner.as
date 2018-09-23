/**
 * Created by varadig on 29/08/14.
 */
package bannertypes.google {
import bannertypes.BannerTypes;

import base.BasePortraitBanner;

public class PortraitBanner extends BasePortraitBanner {
    public function PortraitBanner() {
        super();
    }

    override protected function initialize():void {
        super.initialize();
        this.bannerType = BannerTypes.GOOGLE;
    }
}
}

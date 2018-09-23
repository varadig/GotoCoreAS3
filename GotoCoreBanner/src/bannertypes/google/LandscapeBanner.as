/**
 * Created by varadig on 29/08/14.
 */
package bannertypes.google {
import bannertypes.BannerTypes;

import base.BaseLandscapeBanner;

import core.notification.CoreNotification;

import flash.events.TimerEvent;

import flash.utils.Timer;

public class LandscapeBanner extends BaseLandscapeBanner {
    private const timer:Timer = new Timer(1000, 30);

    public function LandscapeBanner() {
        super();

    }

    override protected function initialize():void {
        super.initialize();
        this.bannerType = BannerTypes.GOOGLE;
        this.timer.addEventListener(TimerEvent.TIMER_COMPLETE, this.onBannerTimeout)
    }

    private function onBannerTimeout(event:TimerEvent):void {
        this.sc.getService(CoreNotification.CREATE_NOTIFICATION)
        .addParam(CoreNotification.NAME,Parameters.BANNER_TIMEOUT_NOTIFICATION)
        .execute()
        .send();
    }
}
}

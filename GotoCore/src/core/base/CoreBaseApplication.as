/**
 * Created by varadig on 1/27/16.
 */
package core.base {
    import core.logger.CoreLoggerBrowserConsole;
    import core.logger.CoreLoggerDebug;
    import core.logger.base.CoreBaseLogger;
    import core.utils.CoreUtils;

    import flash.events.Event;
    import flash.system.Capabilities;


    public class CoreBaseApplication extends CoreBaseMovieClip {

        public function CoreBaseApplication() {
            super();
            this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
        }

        private function addedToStageHandler(event:Event):void {
            this.removeEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
            this.initialize();
        }

        protected function initialize():void {
            this.initCoreModules();
            this.initModules();
        }

        protected function initModules():void {
        }

        protected function initCoreModules():void {
        }
    }
}

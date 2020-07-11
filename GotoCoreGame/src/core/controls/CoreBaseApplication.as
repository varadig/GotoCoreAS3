/**
 * Created by varadig on 1/27/16.
 */
package core.controls {
    import flash.events.Event;

    import core.base.CoreBaseMovieClip;
    import core.layout.base.ILayoutDisplayObject;
    import core.layout.base.ILayout;


    public class CoreBaseApplication extends CoreLayoutGroup implements ILayoutDisplayObject {

        public function CoreBaseApplication() {
            super();
            this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
        }

        private function addedToStageHandler(event:Event):void {
            this.removeEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
            this.initialize();
        }

        protected function initialize():void {
            this.initContext();
            this.initCoreModules();
            this.initModules();
        }

        protected function initContext():void {
            this.context.stage = this.stage;
        }

        protected function initModules():void {
        }

        protected function initCoreModules():void {
        }
    }
}

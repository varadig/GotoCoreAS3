package controller {

    import core.base.CoreBaseClass;
    import flash.events.Event;
    import core.notification.CoreNotification;

    public class CoreApplicationController extends CoreBaseClass {


        public static const NOTIFICATION_REMOVED_FROM:String = "core.application.controller.notification.removed.from.stage";
        public static const NOTIFICATION_RENDER:String = "core.application.controller.notification.render";
        public static const NOTIFICATION_ADDED_TO_STAGE:String = "core.application.controller.notification.added.to.stage";

        private static var instance:CoreApplicationController;

        public static function getInstance():CoreApplicationController {
            if (instance == null)
                instance = new CoreApplicationController();
            return instance;
        }

        public function CoreApplicationController() {
            this.context.stage.addEventListener(Event.ADDED_TO_STAGE, this.onApplicationAddedToStageHandler)
            this.context.stage.addEventListener(Event.ENTER_FRAME, this.onApplicationRenderHandler)
        }

        private function onApplicationRenderHandler(event:Event):void {
            CoreNotification.createNotification(NOTIFICATION_RENDER).send();
        }

        private function onApplicationAddedToStageHandler(event:Event):void {
            this.context.stage.removeEventListener(Event.ADDED_TO_STAGE, this.onApplicationAddedToStageHandler)
            CoreNotification.createNotification(NOTIFICATION_ADDED_TO_STAGE).send();
        }

        private function onApplicationRemovedFromStage(event:Event):void {
            this.context.stage.removeEventListener(Event.REMOVED_FROM_STAGE, this.onApplicationAddedToStageHandler)
            CoreNotification.createNotification(NOTIFICATION_ADDED_TO_STAGE).send();
        }

    }
}

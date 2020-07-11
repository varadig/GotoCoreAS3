package core.controls {
    import core.base.CoreBaseMovieClip;
    import core.layout.base.ILayoutDisplayObject;
    import core.layout.base.ILayout;
    import core.notification.CoreListener;
    import controller.CoreApplicationController;
    import flash.events.Event;
    import flash.display.DisplayObject;

    public class CoreLayoutGroup extends CoreBaseMovieClip implements ILayoutDisplayObject {
        private var _layout:ILayout;

        public function CoreLayoutGroup() {
            super();
            CoreListener.register(CoreApplicationController.NOTIFICATION_RENDER, this.listenerApplicationRender);
            this.stage.addEventListener(Event.RESIZE, this.onStageResizeHandler);
        }


        public function get layout():ILayout {
            return this._layout;
        }

        public function set layout(value:ILayout):void {
            this._layout = value;
            this.draw();
        }

        protected function listenerApplicationRender(params:Array):void {

        }

        private function onStageResizeHandler(event:Event):void {
            this.draw();
        }

        public function draw():void {
            if (this._layout) {
                this._layout.validate()
            }
        }

        override public function addChild(child:flash.display.DisplayObject):flash.display.DisplayObject {
            return super.addChild(child);
        }

        override public function removeChild(child:flash.display.DisplayObject):flash.display.DisplayObject {
            return super.removeChild(child);
        }
    }
}

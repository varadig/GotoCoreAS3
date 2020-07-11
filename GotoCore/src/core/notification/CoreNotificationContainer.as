package core.notification {
    import core.base.CoreBaseClass;
    import core.base.interfaces.IExecutable;

    public class CoreNotificationContainer extends CoreBaseClass {
        private static var instance:CoreNotificationContainer;

        public static function getInstance():CoreNotificationContainer {
            if (instance == null)
                instance = new CoreNotificationContainer();
            return instance;
        }

        public function CoreNotificationContainer():void {
            this.sc.registerService(CoreListener.REGISTER_LISTENER, this.registerListener);
            this.sc.registerService(CoreListener.REGISTER_LISTENERS, this.registerListeners);
            this.sc.registerService(CoreListener.REMOVE_LISTENER, this.removeListener);
            this.sc.registerService(CoreListener.REMOVE_LISTENERS, this.removeListeners);
            this.sc.registerService(CoreListener.REMOVE_LISTENERS_BY_NAME, this.removeListenersByName);
            this.sc.registerService(CoreNotification.CREATE_NOTIFICATION, this.createNotification);
        }

        private var _mapping:Array = [];

        private function registerListener(params:Array):void {
            var name:String = params.name;
            var listener:CoreListener = params.listener;

            if (!this.hasListener(name))
                this._mapping[name] = [];

            this.getListenersOf(name).push(listener);
//        log("register listener:"+JSON.stringify(_mapping));

        }



        private function removeListener(params:Array):void {
            var name:String = params.name;
            var reference:Function = params.reference;

            var listeners:Array = this.getListenersOf(name);
            var index:int = this.getListenerBy(reference, listeners);

            if (index != -1)
                delete listeners[index];
        }

        private function getListenerBy(reference:Function, listeners:Array):int {
            for each (var listener:CoreListener in listeners) {
                if (listener.has(reference))
                    return listeners.indexOf(listener);
            }
            return -1;
        }

        private function createNotification(params:Array):IExecutable {
            var name:String = params.name;
            var listeners:Array = this.getListenersOf(name);
            return new CoreNotification(name, this.getListenersOf(name));
        }

        private function hasListener(name:String):Boolean {
            return (this._mapping[name] != null);
        }

        private function getListenersOf(name:String):Array {

            return (this.hasListener(name) ? this._mapping[name] : []);
        }

        private function removeListenersByName(params:Array):void {
            var name:String = params[CoreListener.NAME];

            var listeners:Array = this.getListenersOf(name);

        }

        private function registerListeners(params:Array):void {

        }

        private function removeListeners(params:Array):void {

        }

        public function get mapping():Array {
            return _mapping;
        }
    }
}


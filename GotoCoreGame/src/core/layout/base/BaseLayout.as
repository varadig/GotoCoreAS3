package core.layout.base {

    public class BaseLayout {
        protected var _layoutDisplayObject:ILayoutDisplayObject;

        public function BaseLayout():void {
        }

        public function get layoutDisdplayObject():ILayoutDisplayObject {
            return this._layoutDisplayObject
        }

        public function set layoutDisdplayObject(value:ILayoutDisplayObject):void {
            this._layoutDisplayObject = value;
        }

    }
}

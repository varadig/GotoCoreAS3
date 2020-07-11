package core.layout.base {

    public interface ILayout {
        function get layoutDisdplayObject():ILayoutDisplayObject;
        function set layoutDisdplayObject(value:ILayoutDisplayObject):void;
        function validate():void;
    }
}

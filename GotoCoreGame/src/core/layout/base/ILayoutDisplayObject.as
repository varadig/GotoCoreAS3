package core.layout.base {

    public interface ILayoutDisplayObject {
        function get layout():ILayout;
        function set layout(value:ILayout):void;
        function draw():void;
    }
}

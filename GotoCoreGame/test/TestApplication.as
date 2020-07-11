package {
    import core.controls.CoreBaseApplication;
    import core.layout.AnchorLayout;

    public class TestApplication extends CoreBaseApplication {
        override protected function initialize():void {
            super.initialize();
            this.layout = new AnchorLayout();
        }

    }
}

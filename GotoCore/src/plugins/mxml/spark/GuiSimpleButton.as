package plugins.mxml.spark
{
import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.service.CoreServiceContainer;

import flash.display.SimpleButton;
import flash.events.MouseEvent;

public class GuiSimpleButton extends SimpleButton
	{
		public function GuiSimpleButton()
		{
			CoreBaseClassFactory.construct( this );
			this.addEventListener( MouseEvent.MOUSE_OVER , this.mouseEventHandler );
			this.addEventListener( MouseEvent.MOUSE_OUT , this.mouseEventHandler );
			this.addEventListener( MouseEvent.ROLL_OUT , this.mouseEventHandler );
			this.addEventListener( MouseEvent.MOUSE_DOWN , this.mouseEventHandler );
			this.addEventListener( MouseEvent.MOUSE_UP , this.mouseEventHandler );
			this.addEventListener( MouseEvent.CLICK , this.mouseEventHandler );
		}

	public var sc:CoreServiceContainer;
	public var context:CoreContext;
	public var callbacks:Array = [];

		public function serviceAddCallback( params:Array ):void
		{
			CoreBaseClassFactory.serviceAddCallback( this , params );
		}

		public function serviceAddCallbacks( params:Array ):void
		{
			CoreBaseClassFactory.serviceAddCallbacks( this , params );
		}

	public function serviceRemoveCallback(params:Array):void {
		CoreBaseClassFactory.serviceRemoveCallback(this, params);
	}

	public function serviceRemoveCallbacks(params:Array):void {
		CoreBaseClassFactory.serviceRemoveCallbacks(this, params);
		}

		protected function createCallBack( group:String ):CoreCallback
		{
			return CoreBaseClassFactory.createCallBack( this , group );
		}

		protected function log( message:Object ):void
		{
			CoreBaseClassFactory.log( this , message );
		}

		protected function mouseEventHandler( event:MouseEvent ):void
		{

			switch ( event.type )
			{
				case MouseEvent.MOUSE_OVER:
					this.createCallBack( "mouse.over" ).send();
					break;
				case MouseEvent.MOUSE_OUT:
					this.createCallBack( "mouse.out" ).send();
					break;
				case MouseEvent.MOUSE_DOWN:
					this.createCallBack( "mouse.down" ).send();
					break;
				case MouseEvent.MOUSE_UP:
					this.createCallBack( "mouse.up" ).send();
					break;
				case MouseEvent.CLICK:
					this.createCallBack( "mouse.click" ).send();
					break;
			}
		}
	}
}

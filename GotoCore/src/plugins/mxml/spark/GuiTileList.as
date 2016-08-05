
package plugins.mxml.spark {
import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.service.CoreServiceContainer;

import flash.events.MouseEvent;

import mx.controls.TileList;

public class GuiTileList extends TileList
	{
	public function GuiTileList() {
		CoreBaseClassFactory.construct(this);

		this.addEventListener(MouseEvent.MOUSE_OVER, this.mouseEventHandler);
		this.addEventListener(MouseEvent.MOUSE_OUT, this.mouseEventHandler);
		this.addEventListener(MouseEvent.MOUSE_DOWN, this.mouseEventHandler);
		this.addEventListener(MouseEvent.MOUSE_UP, this.mouseEventHandler);
		this.addEventListener(MouseEvent.MOUSE_MOVE, this.mouseEventHandler);
		this.addEventListener(MouseEvent.DOUBLE_CLICK, this.mouseEventHandler);
	}

	public var sc:CoreServiceContainer;
		public var context:CoreContext;
		public var callbacks:Array = [];
		public var moveEnabled:Boolean = false;

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

		private function mouseEventHandler( event:MouseEvent ):void
		{
			switch ( event.type )
			{
				case MouseEvent.MOUSE_OVER:

					break;

				case MouseEvent.MOUSE_OUT:

					break;

				case MouseEvent.MOUSE_DOWN:


					break;

				case MouseEvent.MOUSE_UP:

					break;

				case MouseEvent.MOUSE_MOVE:

					break;

				case MouseEvent.DOUBLE_CLICK:
					log( "doubleClicked" );
					break;
			}
		}
	}
}



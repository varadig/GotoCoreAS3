﻿﻿﻿
package core.base {

	public class CoreBaseSender extends CoreBaseParameterHolder
	{
		protected var name:String;

		protected var collection:Array;

		public function CoreBaseSender(name:String, collection:Array):void
		{
			this.name=name;
			this.collection=collection;
		}
	}
}


package core.data.parser
{
import core.data.parser.base.CoreBaseParser;

public class CoreParserJSON extends CoreBaseParser
	{
		override public function parseFrom ( data:String ):Array
		{
			var result:Array = this.JSONToArray ( JSON.parse ( data ));
			return result;
		}
		
		override public function parseTo ( data:Array ):String
		{
			return JSON.stringify ( this.arrayToJSON ( data ), null, 10 );
		}
		
		private function arrayToJSON ( data:Array ):Object
		{
			var object:Object = {};
			
			for ( var key:* in data )
			{
				if ( data[ key ] is Array )
				{
					object[ key ] = this.arrayToJSON ( data[ key ]);
				}
				else
				{
					object[ key ] = data[ key ];
				}
			}
			
			return object;
		}
		
		private function JSONToArray ( data:Object ):Array
		{
			var arrayMap:Array = [];
			
			for ( var key:* in data )
			{
				if ( data[ key ] == "[object Object]" )
				{
					arrayMap[ key ] = this.JSONToArray ( data[ key ]);
				}
				else
				{
					arrayMap[ key ] = data[ key ];
				}
			}
			return arrayMap;
		}
	}
}

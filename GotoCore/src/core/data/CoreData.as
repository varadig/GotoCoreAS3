
package core.data
{
import core.base.CoreBaseClass;
import core.data.parser.CoreParser;

public class CoreData extends CoreBaseClass
	{
		private static var instance : CoreData;
		public static const LOAD_DATA_FROM:String = 'save.data.to';
		public static const SAVE_DATA_TO:String = 'load.data.from';

		public function CoreData () : void 
		{
			CoreParser.getInstance( );
			this.sc.registerService( LOAD_DATA_FROM , this.serviceLoadDataFrom );
			this.sc.registerService( SAVE_DATA_TO , this.serviceSaveDataTo );
		}

		public static function getInstance () : CoreData 
		{
			if(CoreData.instance == null)
			{
				CoreData.instance = new CoreData( );
			}
			return CoreData.instance;
		}

		private function serviceLoadDataFrom (params : Array) : Array
		{
			var path : String = params["path"] + "." + this.context.getParam( "data.type" );

			var data : String = this.sc.getService( "read.text.file" )
				.addParam( "path" , path )
				.execute( ) as String;

			var result : Array = this.sc.getService( "parse.from." + this.context.getParam( "data.type" ) ).addParam( "data" , data ).execute( ) as Array; 

			return result as Array;
		}

		private function serviceSaveDataTo (params : Array) : void 
		{
			var path : String = params["path"] + "." + this.context.getParam( "data.type" );

			var content : String = this.sc.getService( "parse.to." + this.context.getParam( "data.type" ) )
				.addParam( "data" , params["data"] )
				.execute( ) as String;

			this.sc.getService( "create.text.file" )
				.addParam( "path" , path )
				.addParam( "content" , content )
				.execute( );
		}
	}
}



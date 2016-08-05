package core.data.parser
{
import core.base.CoreBaseClass;

public class CoreParser extends CoreBaseClass
{
	private static var instance:CoreParser;
	public static const PARSE_FROM_YAML:String = 'parse.from.yaml';
	public static const PARSE_TO_YAML:String = 'parse.to.yaml';
	public static const PARSE_FROM_JSON:String = 'parse.from.json';
	public static const PARSE_TO_JSON:String = 'parse.to.json';

	public function CoreParser():void
	{
		this.sc.registerService(PARSE_FROM_JSON, this.serviceFromJson);
		this.sc.registerService(PARSE_TO_JSON, this.serviceToJson);
	}

	public static function getInstance():CoreParser
	{
		if (CoreParser.instance == null)
		{
			CoreParser.instance = new CoreParser();
		}
		return CoreParser.instance;
	}

	private function serviceFromJson(params:Array):Array
	{
		return new CoreParserJSON().parseFrom(params[  "data"  ]);
	}

	private function serviceToJson(params:Array):String
	{
		return new CoreParserJSON().parseTo(params[  "data"  ] as Array);
	}
}
}



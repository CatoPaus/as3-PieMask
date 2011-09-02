package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Julian Garamendy
	 */
	public class Main extends Sprite 
	{
		private var piemask:PieMask;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			var circ:Sprite = new Sprite();
			circ.graphics.beginFill(0xff9900, 1);
			circ.graphics.drawCircle(0, 0, 50);
			circ.graphics.endFill();
			addChild(circ);
			circ.x = circ.y = 200;
			
			var pmask:Sprite = new Sprite();
			addChild(pmask);
			pmask.x = pmask.y = 200;
			circ.mask = pmask;
			
			piemask = new PieMask( pmask.graphics, .01, 50, 0, 0, 0, 3);
			
			addEventListener( Event.ENTER_FRAME, step );
			
		}
		
		private function step(e:Event):void 
		{
			piemask.percentage = mouseX / stage.stageWidth;;
			piemask.drawWithFill();
			
		}
		
		
	}
	
}
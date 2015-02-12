
import com.haxepunk.Entity;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

// Import our sprites
import entities.Enemy;
import entities.Player;

class MainScene extends Scene {

	public function new() {
		super();
	}

	public override function begin() {

		// Sets the background image for this scene
		addGraphic(new Image("graphics/background.png"));
		
		// Add enemies and player to the scene
		spawn();

		add(new Player(100, 200));
	}

	public override function update() {

		// Set spawn timer and update every second
		spawnTimer -= HXP.elapsed;

		if (spawnTimer < 0) {
			spawn();
		}

		super.update();
	}

	private function spawn() {

		var x = 0;
		// trace(x);
		var y = Math.round((Math.random() * (HXP.height)/2));
		// trace(y);
		add(new Enemy(x, y));
		spawnTimer = 1;
	}

	private var Enemy:Entity;
	private var Player:Entity;
	private var spawnTimer:Float;
}
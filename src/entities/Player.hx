package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

class Player extends Entity
{
    public function new(x:Int, y:Int)
    {
        super(x, y);

        graphic = new Image("graphics/target.png");

        // Hitboxes are rectangular by default... perfect
        setHitbox(150, 150);        
    }

    public override function update() {

    	// Handle mouse events
    	if (Input.check(Key.UP)) {
    		moveBy(0, -5);
    	}
    	if (Input.check(Key.DOWN)) {
    		moveBy(0, 5);
    	}
    	if (Input.check(Key.LEFT)) {
    		moveBy(-5, 0);
    	}
    	if (Input.check(Key.RIGHT)) {
    		moveBy(5, 0);
    	}

    	// Handle collisions
    	var score = 0;

    	var e:Entity = collide("enemy", x, y);

    	if (e != null) {
    		
    		var enemy:Enemy = cast(e, Enemy);
    		enemy.destroy();
    	}

    	// Handle updates
    	super.update();
    }
}
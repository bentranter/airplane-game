package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class Enemy extends Entity
{
    public function new(x:Int, y:Int)
    {
        super(x, y);

        graphic = new Image("graphics/enemy1.png");

        setHitbox(150, 75);
        setHitbox(150, 75);

        // Define type
        type = "enemy";
    }

    // Try to setup events
    public override function update() {

    	// Set enemy direction on spawn
    	moveBy(4, 0);
    }

    // Handle destruction of entity (for collisions)
    public function destroy() {
    	// Remove from scene
    	scene.remove(this);
    }
}


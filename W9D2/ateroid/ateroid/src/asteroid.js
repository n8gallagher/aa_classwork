import Util from "./util.js";


const CONSTANTS = {
    COLOR: "#800080",
    RADIUS: 6
};

export class Asteroid {
   
   constructor() {
    Asteroid.COLOR = CONSTANTS.COLOR;
    Asteroid.RADIUS = CONSTANTS.RADIUS;
   }
};
Util.inherits(Asteroid, MovingObject);


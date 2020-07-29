Function.prototype.inherits = function (parent) {
    function surrogate() {};
    surrogate.prototype = parent.prototype;
    this.prototype = new surrogate();
    this.prototype.constructor = this;

};

function MovingObject () {
    MovingObject.prototype.sayHi = function() {
        console.log("can say hi!");
    };
};

function Ship () {
    Ship.prototype.shipsOnly = function() {
        console.log("only a ship can say this");
    };
};
Ship.inherits(MovingObject);

function Asteroid () {
    Asteroid.prototype.asteroidsOnly =  function() {
        console.log("only a space rock can rock like this");
    };
};
Asteroid.inherits(MovingObject);

const object = new MovingObject();
const ship = new Ship();
const asteroid = new Asteroid();

console.log(object.sayHi());
console.log(ship.sayHi());
console.log(asteroid.sayHi());

console.log(ship.shipsOnly());
// console.log(asteroid.shipsOnly());
// console.log(object.shipsOnly());

console.log(asteroid.asteroidsOnly());
// console.log(ship.asteroidsOnly());
// console.log(object.asteroidsOnly());
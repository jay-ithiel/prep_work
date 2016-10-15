Function.prototype.inherits = function(parentClass) {
  function Surrogate() {};
  Surrogate.prototype = parentClass.prototype
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
}


function MovingObject () {
};

MovingObject.prototype.speed = function() {
  console.log(10);
}

function Ship () {};
Ship.inherits(MovingObject);

function Asteroid () {};
Asteroid.inherits(MovingObject);

ship = new Ship();
asteroid = new Asteroid();

ship.speed();
asteroid.speed();

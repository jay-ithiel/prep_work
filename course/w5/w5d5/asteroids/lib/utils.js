const Util = {
  inherits (childClass, parentClass) {
    function Surrogate() {};
    Surrogate.prototype = parentClass.prototype
    childClass.prototype = new Surrogate();
    childClass.prototype.constructor = childClass;
  },

  randomVec(length) {
    let y = Math.random() * length;
    let x = Math.random() * length;
    return [x, y];
  }
}


module.exports = Util;

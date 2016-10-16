const Util = {
  inherits(childClass, ParentClass) {
    function Surrogate() {};
    Surrogate.prototype = parentClass.prototype;
    childClass.prototype = new Surrogate();
    childClass.prototype.constructor = childClass;
  },

  randomVec(length) {
    let x = Math.random() * length;
    let y = Math.random() * length;
    return [x, y];
  }
}

module.exports = Util;

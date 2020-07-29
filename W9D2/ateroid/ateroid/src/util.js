 const Util = {
    inherits: function(childClass, parentClass) {

        function surrogate () {};
        surrogate.prototype = parentClass.prototype;
        childClass.prototype = new surrogate;
        childClass.prototype.constructor = childClass;
    },
    randomVec: function(length) {
        const deg = 2 * Math.PI * Math.random();
        return Util.scale([Math.sin(deg), Math.cos(deg)], length);
    },
    // Scale the length of a vector by the given amount.
    scale: function(vec, m) {
        return [vec[0] * m, vec[1] * m];
    }
};
export default Util;
// export function sayHi(user) {
//     alert(`Hello, ${user}!`);
// }

//  module.exports = Util;

//  function surrogate() {};
//  surrogate.prototype = parent.prototype;
//  this.prototype = new surrogate();
//  this.prototype.constructor = this;
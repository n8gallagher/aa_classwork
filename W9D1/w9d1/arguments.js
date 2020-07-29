// function sum() {
//   let args = Array.from(arguments);
//   let sum = 0;
//   for(let i = 0; i < args.length; i++) {
//     sum += args[i];
//   }
//   return sum;
// };

function sum(...args) {
  let sum = 0;
  for(let i = 0; i < args.length; i++) {
    sum += args[i];
  }
  return sum;
}

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);
//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

// Function.prototype.myBind = function(ctx, ...bindArgs) {
//   return (...callArgs) => {
//     return this.apply(ctx, bindArgs.concat(callArgs));
//   };
// };

Function.prototype.myBind = function (ctx, ...bindArgs) {
  that = this;
  return function(...callArgs) {
    return that.apply(ctx, bindArgs.concat(callArgs));
  };
};

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// // Pavlov says meow to me!
// // true
let curriedSum = function (numArgs) {
    let numbers = [];
    return function _curriedSum (number) {
        numbers.push(number);
        if (numbers.length === numArgs) {
            let sum = 0;
            numbers.forEach( el => {
                sum += el;
            });
            return sum;
        } else {
            return _curriedSum;
        }
    };
};

// const sumum = curriedSum(4);
// console.log(sumum(5)(30)(20)(1)); // => 56

Function.prototype.curry = function(numArgs) {
    that = this;
    let args = [];
    return function _curry(arg) {
      args.push(arg);
      // console.log(args);
      if (numArgs === args.length) {
          return that.apply(that, args);
      } else {
        return _curry;
      }
    };
};

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

// console.log(sumThree(4, 20, 6)); // == 30

// you'll write `Function#curry`!
let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
f1 = f1(6); // = 30

// or more briefly:
console.log(sumThree.curry(3)(4)(20)(6)); // == 30
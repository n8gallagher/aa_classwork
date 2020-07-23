Array.prototype.myEach = function() {
    for (let i = 0; i < this.length; i++) {
        return function = callback(){

        item = this[i]
    //   console.log(  callback(item))
        callback(item);
    }
}
}

function double(item) {
    return item * 2
}

let a = [2, 8, 12]



Array.prototype.myMap = function(callback) {
 
    let results = []
    results.push(this.myEach(callback))
}

console.log(a.myEach(double))


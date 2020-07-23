 Array.prototype.uniq = function() {
    let results = []
    for (let i = 0; i < this.length; i++) {
        if (results.indexOf(this[i]) === -1) {
            results.push(this[i])
        }
    }
    return results
 }

 Array.prototype.twoSum = function() {
    let results = []

    for (let i = 0; i < this.length; i++) {
        for (let j = i + 1; j < this.length; j++) {
            if (this[i] + this[j] === 0 ){
                results.push([i,j])
            }
        }
    }
    return results 
 }
let a = [
 [1,2,3], //[1][0]
 [4,5,6],
 [7,8,9]
]

// let b = [
// [1,4,7],
// [2,5,8],  
// [3,6,9] 
// ]

 Array.prototype.transpose = function() {
        let results = []
        for (let i = 0; i < this.length; i++) {
            let sub =[]
            for (let j = 0 ; j < this.length; j++) {
               sub.push(this[j][i])
            }
            results.push(sub)
            sub = []
        }
        return results 
 }
//  console.log([1,1,2,2,3,4,5,6,6].uniq())

// console.log([1,-1,4,3,5,4,-4,7,9,-3].twoSum())

console.log(a.transpose())
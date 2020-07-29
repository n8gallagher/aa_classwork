const MovingObject = require("./moving_object.js")
const Asteroid = require("./asteroid.js")

window.MovingObject = MovingObject;
window.addEventListener("DOMContentLoaded", (event) => {
    console.log("content loaded");
    const canvas = document.getElementById("game_view");
    const context = canvas.getContext("2d");
    window.context = context;
});


const mo = new MovingObject({
    pos: [30,30],
    vel: [10,10],
    radius: 5,
    color: "#00FF00",
});

const Ao = new Asteroid({
    pos: [30, 20],
    vel: [50, 50],

});

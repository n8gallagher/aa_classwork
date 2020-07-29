const CONSTANTS = {
    GRAVITY:  0.8,
    FLAP_SPEED:  -8,
    TERMINAL_VEL:  12,
    BIRD_WIDTH:  40,
    BIRD_HEIGHT:  30
  };


export default class Bird {
  constructor(dimensions) {
    this.velocity = 0.5;
    this.dimensions = dimensions;
    this.birdX = dimensions.width / 3;
    this.birdY = dimensions.height / 2;
  };

  drawBird(ctx) {
    ctx.fillStyle = "yellow";
    ctx.fillRect(this.birdX, this.birdY, 40, 30);
  };

  animate(ctx) { 
    this.move();
    this.drawBird(ctx);
  };

  move() {
      //schmoovin'
      this.birdY += this.velocity;
      this.velocity += CONSTANTS.GRAVITY;
  }

  flap() {
      this.velocity = CONSTANTS.FLAP_SPEED;
  }
}
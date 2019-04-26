var num = 100;
var mod = 20;
var gen = 0;
var state = new Array(num);

function setup(){
  createCanvas(500, 500);
  colorMode(HSB, 1);
  initialize();
}

function draw(){
  drawCell();
  updateState();
  if(gen == 187){
    noLoop();
  }
  gen++;
}

function initialize(){
  for(x = 0; x < num; x++) {
    state[x] = new Array(num);
    for(y = 0; y < num; y++) {
      state[x][y] = 0;
    }
  }
  state[0][0] = 1;
}

function drawCell(){
  var scalar = float(height/ num);
  // float y = 0;
  // float x;
  var y = 0;
  var x;
  for (i = 0; i < num; i++){
    x = 0;
    for (j = 0; j< num; j++){
      noStroke();
      var col = float( state[i][j] * 1.0 / mod );
      fill(col, col, 1);
      rect(x, y, scalar, scalar);
      x += scalar;
    }
    y += scalar;
  }
}

function updateState(){
  var nextState = new Array(num)
  for (i = 0; i < num; i++){
    nextState[i] = new Array(num);
    for (j = 0; j< num; j++){
      nextState[i][j] = transition(i, j);
    }
  }
  state = nextState;
}

function transition(i, j){
  var nextC;
  nextC = state[(i - 1 + num) % num][j]
    + state[i][(j - 1 + num) % num]
    + state[i][j]
    + state[i][(j + 1) % num]
    + state[(i + 1) % num][j];
  nextC = nextC % mod;
  return nextC;
}

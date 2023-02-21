
int x, y;
int step = 1;
int stepSize = 1;
int numSteps = 1;
int state = 0;
int turnCounter = 0;
int px, py = 0;
int totalSteps = 0;


boolean isPrime(int value) {
  if (value == 1) return false;
  for (int i = 2; i <= sqrt(value); i++) {
    if (value % i == 0) {
      return false;
    }
  }
  return true;
}

void setup() {
  size(1000, 1000);

  int cols = width / stepSize;
  int rows = height / stepSize;

  totalSteps = cols * rows;
  x = width / 2;
  y = height / 2;
  
  background(0);

  while(step <= totalSteps) {
  //textSize(stepSize);
  //textSize(CENTER, CENTER);
  //text(step, x, y);

  noStroke();
  if (isPrime(step) && turnCounter % 2 == 0) {
    fill(255, 0, 0);
    circle(x, y, stepSize * 0.5);
  }
  else if(isPrime(step) && turnCounter % 3 ==0) {
    fill(0, 255, 0);
    circle(x, y, stepSize * 0.5);
  }
  else if(isPrime(step) && turnCounter % 5 ==0) {
    fill(0, 0, 255);
    circle(x, y, stepSize * 0.5);
  }
  //line(x, y, px, py);
  px = x;
  py = y;

  switch (state) {
    case 0: x += stepSize; break;
    case 1: y -= stepSize; break;
    case 2: x -= stepSize; break;
    case 3: y += stepSize; break;
  }

  if (step % numSteps == 0) {
    state = (state + 1) % 4;
    turnCounter++;
    if (turnCounter % 2 == 0)
    numSteps++;
  }
  step++;
  }
  save("primeSpiral.png");
}

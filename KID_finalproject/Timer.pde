class Timer {
  float x, y;
  int timer = 30; // set the timer to 60 seconds
  int currentTime = 0; // initialize the current time to 0

  // Constructor
  Timer() {
    this.x = 750;
    this.y = 50;
  }

  void display() {
    // update the timer
    if (frameCount % 60 == 0 && currentTime < timer) {
      currentTime++;
    }

    // display the timer
    text((timer - currentTime), x, y);
  }

  // Check the current time
  int checkTime() {
    return currentTime;
  }

  // Reset timer
  void reset() {
    this.currentTime = 0;
  }
}

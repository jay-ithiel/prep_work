class Clock {
  constructor() {
    const date = new Date();
    this.hour = date.getHours();
    this.min = date.getMinutes();
    this.sec = date.getSeconds();
    setInterval(this._tick.bind(this), 1000);
  }

  printTime() {
    this.min = Math.floor(this.sec / 60) + this.min;
    this.hour= Math.floor(this.min /  60) + this.hour;
    this.hour > 24 ? this.hour -= 24 : this.hour;
    this.sec = Math.floor(this.sec % 60);

    let hr = this.ensureDoubleDigits(this.hour);
    let min = this.ensureDoubleDigits(this.min);
    let sec = this.ensureDoubleDigits(this.sec);
    console.log(`${hr}:${min}:${sec}`);
  }

  ensureDoubleDigits(n) {
    let dd = n < 10 ? `0${n}` : n;
    return dd;
  }

  _tick() {
    this.sec++;
    this.printTime();
  }
}

const clock = new Clock();

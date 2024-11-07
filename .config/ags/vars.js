export const time = Variable("", {
  poll: [
    1000,
    ["date", "+%H;%M;%S;%d;%b;%A"],
    (out) => {
      let splitTime = out.split(";");
      return new Object({
        hr: splitTime[0],
        min: splitTime[1],
        sec: splitTime[2],
        day: splitTime[3],
        monthName: splitTime[4],
        dayName: splitTime[5],
      });
    },
  ],
});

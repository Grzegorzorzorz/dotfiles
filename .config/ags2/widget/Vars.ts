import { Variable } from "astal/variable";

class Time {
  hour = 0;
  minute = 0;
  second = 0;
  day = 0;
  weekdayName = "";
  monthName = "";
}

export const time = Variable<Time>({
  hour: 0,
  minute: 0,
  second: 0,
  day: 1,
  weekdayName: "Monday",
  monthName: "Jan",
}).poll(1000, ["date", "+%H;%M;%S;%d;%b;%A"], (out: string) => {
  let split = out.split(";");
  return {
    hour: parseInt(split[0]),
    minute: parseInt(split[1]),
    second: parseInt(split[2]),
    day: parseInt(split[3]),
    monthName: split[4],
    weekdayName: split[5],
  };
});

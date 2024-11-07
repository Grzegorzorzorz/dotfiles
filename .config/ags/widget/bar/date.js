import * as vars from "../../vars.js";

function getDaySuffix(day) {
  switch (day[1]) {
    case "1":
      return "st";
    case "2":
      return "nd";
    case "3":
      return "rd";
    default:
      return "th";
  }
}

function removeLeadingZero(day) {
  if (day[0] == "0") {
    return day[1];
  }

  return day;
}

export const date = () =>
  Widget.EventBox({
    on_primary_click: () => App.toggleWindow("calendar0"),
    child: Widget.Box({
      class_name: "date",
      children: [
        Widget.Label({
          label: vars.time.value.sec,
          hpack: "center",
          connections: [
            [
              vars.time,
              (self) => {
                self.label = `${vars.time.value.hr}:${vars.time.value.min}`;
              },
            ],
          ],
        }),
        Widget.Label({
          label: " - ",
        }),
        Widget.Label({
          label: vars.time.value.sec,
          hpack: "center",
          connections: [
            [
              vars.time,
              (self) => {
                self.label = `${vars.time.value.dayName} `;
              },
            ],
          ],
        }),
        Widget.Box({
          children: [
            Widget.Label({
              label: vars.time.value.sec,
              hpack: "center",
              connections: [
                [
                  vars.time,
                  (self) => {
                    self.label = `${removeLeadingZero(vars.time.value.day)}`;
                  },
                ],
              ],
            }),
            Widget.Label({
              label: vars.time.value.sec,
              hpack: "center",
              class_name: "superscript",
              connections: [
                [
                  vars.time,
                  (self) => {
                    self.label = `${getDaySuffix(vars.time.value.day)}`;
                  },
                ],
              ],
            }),
          ],
        }),
        Widget.Label({
          label: vars.time.value.sec,
          hpack: "center",
          connections: [
            [
              vars.time,
              (self) => {
                self.label = ` ${vars.time.value.monthName}.`;
              },
            ],
          ],
        }),
      ],
    }),
  });

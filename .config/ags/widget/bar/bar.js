import * as battery from "./battery.js";
import * as date from "./date.js";
import * as hyprland from "./hyprland.js";
import * as sysTray from "./sysTray.js";
import * as launcher from "./launcher.js";
import * as menu from "./menu.js";
import * as audio from "./audio.js";

export const bar = (monitor = 0) =>
  Widget.Window({
    monitor,
    name: `bar${monitor}`,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    keymode: "on-demand",
    class_name: "bar",
    child: Widget.CenterBox({
      class_name: "bar",
      startWidget: Widget.Box({
        hexpand: true,
        children: [
          launcher.launcherButton(monitor),
          hyprland.workspaces(),
          hyprland.winTitle(),
        ],
      }),
      centerWidget: Widget.Box({
        hpack: "center",
        children: [date.date()],
      }),
      endWidget: Widget.Box({
        hexpand: true,
        children: [
          sysTray.sysTray(),
          Widget.Box({ expand: true }),
          audio.speakerVol(),
          battery.batteryProgress(),
          menu.menuButton(),
        ],
      }),
    }),
  });

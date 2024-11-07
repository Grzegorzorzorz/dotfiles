const battery = await Service.import("battery");

export const batteryProgress = () =>
  Widget.Box({
    class_name: "module-wrapper",
    children: [
      Widget.Icon({
        icon: battery.bind("icon-name"),
      }),
      Widget.LevelBar({
        vertical: false,
        vexpand: false,
        widthRequest: 75,
        heightRequest: 1,
        visible: battery.bind("available"),
        value: battery.bind("percent").as((p) => (p > 0 ? p / 100 : 0)),
      }),
    ],
  });

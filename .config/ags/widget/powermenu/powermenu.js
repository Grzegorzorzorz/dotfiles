const optionButton = (icon, label, winName, exec) =>
  Widget.CenterBox({
    vertical: true,
    centerWidget: Widget.Button({
      onClicked: () => {
        exec();
        App.closeWindow(winName);
      },
      child: Widget.Box({
        vertical: true,
        children: [
          Widget.Label({
            label: icon,
            class_name: "power-icon",
          }),
          Widget.Label({
            label: label,
            class_name: "power-label",
          }),
        ],
      }),
    }),
  });

const options = (winName) =>
  Widget.Box({
    spacing: 40,
    children: [
      Widget.Box({ hexpand: true }),
      optionButton("󰤄", "Suspend", winName, () =>
        Utils.execAsync(["loginctl", "suspend"]),
      ),
      optionButton("󰌾", "Lock", winName, () =>
        Utils.execAsync(["loginctl", "lock-session"]),
      ),
      optionButton("⭘", "Reboot", winName, () =>
        Utils.execAsync(["loginctl", "reboot"]),
      ),
      optionButton("󰐥", "Power off", winName, () =>
        Utils.execAsync(["loginctl", "lock-session"]),
      ),
      Widget.Box({ hexpand: true }),
    ],
  });

const date = () =>
  Widget.Box({
    children: [
      Widget.Box({ hexpand: true }),
      Widget.Label({
        label: "asdf",
      }),
      Widget.Box({ hexpand: true }),
    ],
  });

export const powermenu = (monitor = 0, displayOptions = true) =>
  Widget.Window({
    monitor: monitor,
    name: `powermenu${monitor}`,
    anchor: ["top", "bottom", "left", "right"],
    layer: "overlay",
    exclusivity: "ignore",
    keymode: "exclusive",
    class_name: "powermenu",
    visible: false,
    setup: (self) =>
      self.keybind("Escape", () => {
        App.closeWindow(self.name);
      }),
    child: Widget.CenterBox({
      vertical: true,
      start_widget: date(),
      center_widget: options(`powermenu${monitor}`),
    }),
  });

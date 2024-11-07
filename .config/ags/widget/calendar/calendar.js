export const calendar = (monitor = 0) =>
  Widget.Window({
    monitor,
    name: `calendar${monitor}`,
    anchor: ["top"],
    exclusivity: "normal",
    keymode: "on-demand",
    class_name: "calendar-win",
    visible: false,
    setup: (self) =>
      self.keybind("Escape", () => {
        App.closeWindow(`calendar${monitor}`);
      }),
    child: Widget.EventBox({
      onHoverLost: () => App.closeWindow(`calendar${monitor}`),
      child: Widget.Box({
        class_name: "calendar-wrapper",
        child: Widget.Calendar({
          showDayNames: true,
          showDetails: true,
          showHeading: true,
        }),
      }),
    }),
  });

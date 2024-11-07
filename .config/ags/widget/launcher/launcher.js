const { appServ } = await Service.import("applications");

export const launcher = Widget.Window({
  name: "launcher",
  visible: false,
  anchor: [],
  exclusivity: "exclusive",
  keymode: "exclusive",
  setup: (self) =>
    self.keybind("Escape", () => {
      App.closeWindow(self.name);
    }),
  child: Widget.Box({
    class_name: "launcher",
    child: Widget.Label("hello, world!"),
  }),
});

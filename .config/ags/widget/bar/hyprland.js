const hyprland = await Service.import("hyprland");

export const winTitle = () =>
  Widget.Label({
    label: hyprland.active.client.bind("title"),
    visible: hyprland.active.client.bind("address").as((addr) => addr !== "0x"),
    truncate: "end",
    maxWidthChars: 60,
    wrap: true,
    class_name: "win-title",
  });

const dispatch = (ws) => hyprland.messageAsync(`dispatch workspace ${ws}`);

export const workspaces = (numWs = 10) =>
  Widget.Box({
    child: Widget.EventBox({
      class_name: "workspaces",
      onScrollUp: () => dispatch("e-1"),
      onScrollDown: () => dispatch("e+1"),
      child: Widget.Box({
        children: Array.from({ length: numWs }, (_, i) => i + 1).map((i) =>
          Widget.Button({
            attribute: i,
            label: `${i}`,
            onClicked: () => dispatch(i),
          }),
        ),

        // remove this setup hook if you want fixed number of buttons
        setup: (self) =>
          self.hook(hyprland, () =>
            self.children.forEach((btn) => {
              btn.visible = hyprland.workspaces.some(
                (ws) => ws.id === btn.attribute,
              );
              btn.class_name =
                hyprland.active.workspace.id === btn.attribute
                  ? "active"
                  : "inactive";
            }),
          ),
      }),
    }),
  });

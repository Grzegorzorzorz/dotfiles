const systemtray = await Service.import("systemtray");

const SysTrayItem = (item) =>
  Widget.Button({
    child: Widget.Icon().bind("icon", item, "icon"),
    tooltipMarkup: item.bind("tooltip_markup"),
    onPrimaryClick: (_, event) => item.activate(event),
    onSecondaryClick: (_, event) => item.openMenu(event),
    class_name: "sys-tray-item",
  });

export const sysTray = () =>
  Widget.Box({
    class_name: "module-wrapper",
    children: systemtray.bind("items").as((i) => i.map(SysTrayItem)),
  });

/*
export function sysTrayBar() {
  let revealer = Widget.Revealer({
    revealChild: false,
    transitionDuration: 150,
    transition: "crossfade",
    child: Widget.Box({
      children: sysTray(),
    }),
  });

  let arrow = Widget.Label({
    label: "󰔶",
    angle: 270,
    class_name: "sys-tray-arrow",
  });
  let box = Widget.Label({
    label: " 󰚇",
    class_name: "sys-tray-box",
  });
  return Widget.Box({
    children: [
      revealer,
      Widget.Button({
        class_name: "sys-tray",
        child: Widget.Box({
          children: [arrow, box],
        }),
        onPrimaryClick: () => {
          revealer.reveal_child = !revealer.reveal_child;
          arrow.angle = revealer.reveal_child ? 90 : 270;
        },
      }),
    ],
  });
}
*/

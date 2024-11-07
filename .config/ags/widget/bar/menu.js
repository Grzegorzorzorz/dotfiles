export const menuButton = (monitor = 0) =>
  Widget.Button({
    label: "󰚅",
    class_name: "menu-button",
    onClicked: () => App.toggleWindow(`powermenu${monitor}`),
  });

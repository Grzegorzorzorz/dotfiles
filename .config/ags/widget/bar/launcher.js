export function launcherButton(monitor) {
  return Widget.Button({
    label: "",
    class_name: "launcher-button",
    onClicked: () => App.toggleWindow(`launcher`),
  });
}

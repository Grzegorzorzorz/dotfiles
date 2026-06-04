import { App } from "astal/gtk3";
import style from "./style.scss";
import Bar from "./widget/Bar";
import Notif from "./widget/Notif";

App.start({
  instanceName: "bar",
  css: style,
  main: () => {
    //App.get_monitors().map(Bar);
    Bar(App.get_monitors().at(0));
  },
});

//App.start({
//  instanceName: "notif",
//  css: style,
//  main: () => App.get_monitors().map(Notif),
//});

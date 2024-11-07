App.addIcons(`${App.configDir}/icons`);

import * as bar from "./widget/bar/bar.js";
import * as launcher from "./widget/launcher/launcher.js";
import * as calendar from "./widget/calendar/calendar.js";
import { powermenu } from "./widget/powermenu/powermenu.js";

const css = `${App.configDir}/css/style.css`;

App.applyCss(css);

Utils.monitorFile(`${App.configDir}/css`, () => {
  App.resetCss();
  App.applyCss(css);
});

App.config({
  windows: [bar.bar(0), launcher.launcher, calendar.calendar(0), powermenu(0)],
});

App.addWindow();

import { Astal, Gdk, Gtk } from "astal/gtk3";
import { bind, GLib } from "astal";

import { time } from "./Vars";

import Battery from "gi://AstalBattery";
import Hyprland from "gi://AstalHyprland";
import Pango from "gi://Pango?version=1.0";
import Tray from "gi://AstalTray";
import Wp from "gi://AstalWp";
import Network from "gi://AstalNetwork";
import Console from "console";

function AudioLevel() {
  const speaker = Wp.get_default()?.audio.defaultSpeaker!;

  function scroll(_: Astal.EventBox, event: Astal.ScrollEvent) {
    let volNew = speaker.volume;

    if (event.delta_y > 0) {
      volNew -= 0.05;
    } else if (event.delta_y < 0) {
      volNew += 0.05;
    }

    if (volNew >= 1.0) {
      volNew = 1.0;
    }

    if (volNew <= 0.0) {
      volNew = 0.0;
    }

    speaker.volume = volNew;
  }

  function click(_: Astal.EventBox, event: Astal.ClickEvent) {
    if (event.button == Astal.MouseButton.PRIMARY) {
      speaker.mute = !speaker.mute;
    }
  }

  return (
    <eventbox onScroll={scroll} onClick={click}>
      <box className="audio-level">
        <icon icon={bind(speaker, "volumeIcon")} />
        <label
          label={bind(speaker, "volume").as(
            (vol) => `${Math.round(vol * 100)}%`,
          )}
        />
      </box>
    </eventbox>
  );
}

function BatteryLevel() {
  const bat = Battery.get_default();

  return (
    <box className="battery-level">
      <icon icon={bind(bat, "icon-name")} />
      <levelbar value={bind(bat, "percentage")} widthRequest={75}></levelbar>
    </box>
  );
}

function Date() {
  function getDaySuffix(day: number): string {
    // Fix the 11st problem
    if (10 < day && day < 20) {
      return "th";
    }

    switch (day % 10) {
      case 1:
        return "st";
      case 2:
        return "nd";
      case 3:
        return "rd";
      default:
        return "th";
    }
  }

  function addLeadingZero(time: number): string {
    if (time < 10) {
      return "0" + time.toString();
    }
    return time.toString();
  }

  return (
    <box className="date">
      <box>
        <label label={bind(time).as((t) => `${addLeadingZero(t.hour)}`)} />
        <label label={":"} />
        <label label={bind(time).as((t) => `${addLeadingZero(t.minute)}`)} />
      </box>
      <label label={" - "} />
      <label label={bind(time).as((t) => `${t.weekdayName} `)} />
      <box>
        <label label={bind(time).as((t) => `${t.day}`)} />
        <label
          className="superscript"
          label={bind(time).as((t) => `${getDaySuffix(t.day)}`)}
        />
      </box>
      <label label={bind(time).as((t) => ` ${t.monthName}.`)} />
    </box>
  );
}

function Launcher() {
  return <label className="launcher" label="" />;
}

function Menu() {
  return <label label="MENU" />;
}

function NetworkStatus() {
  const network = Network.get_default();
  return (
    <eventbox>
      <box className="audio-level">
        <icon icon={bind(network, "wifiIcon")} />
        <label label={bind(network.wifi, "ssid")} />
      </box>
    </eventbox>
  );
}

function SysTray() {
  const tray = Tray.get_default();

  return (
    <box
      className="sys-tray"
      visible={bind(tray, "items").as((items) => items.length != 0)}
    >
      {bind(tray, "items").as((items) =>
        items.map((item: any) => (
          <menubutton
            className="sys-tray-item"
            tooltipMarkup={bind(item, "tooltipMarkup")}
            usePopover={false}
            actionGroup={bind(item, "action-group").as((ag) => [
              "dbusmenu",
              ag,
            ])}
            menuModel={bind(item, "menu-model")}
          >
            <icon gicon={bind(item, "gicon")} />
          </menubutton>
        )),
      )}
    </box>
  );
}

function WinTitle() {
  const hypr = Hyprland.get_default();
  const focus = bind(hypr, "focusedClient");

  return (
    <box className="win-title" visible={focus.as(Boolean)}>
      {focus.as(
        (client) =>
          client && (
            <label
              maxWidthChars={60}
              ellipsize={Pango.EllipsizeMode.MIDDLE}
              label={bind(client, "title").as(String)}
            />
          ),
      )}
    </box>
  );
}

function Workspaces() {
  const hypr = Hyprland.get_default();

  function scroll(_: Astal.EventBox, event: Astal.ScrollEvent) {
    if (event.delta_y > 0) {
      hypr.dispatch("workspace", "e+1");
    } else if (event.delta_y < 0) {
      hypr.dispatch("workspace", "e-1");
    }
  }

  return (
    <box className="wss">
      <eventbox onScroll={scroll}>
        <box>
          {bind(hypr, "workspaces").as((wss) =>
            wss
              .filter(
                (ws: AstalHyprland.Workspace) => !(ws.id >= -99 && ws.id <= -2),
              ) // filter out special workspaces
              .sort(
                (a: AstalHyprland.Workspace, b: AstalHyprland.Workspace) =>
                  a.id - b.id,
              )
              .map((ws: AstalHyprland.Workspace) => (
                <button
                  className={bind(hypr, "focusedWorkspace").as((fw) =>
                    ws === fw ? "active" : "inactive",
                  )}
                  onClicked={() => ws.focus()}
                >
                  {ws.id}
                </button>
              )),
          )}
        </box>
      </eventbox>
    </box>
  );
}

export default function Bar(monitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;

  return (
    <window
      gdkmonitor={monitor}
      name={`bar${monitor}`}
      namespace="bar"
      className="bar"
      heightRequest={36}
      layer={Astal.Layer.TOP}
      anchor={TOP | LEFT | RIGHT}
      keymode={Astal.Keymode.ON_DEMAND}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      visible
    >
      <centerbox>
        <box halign={Gtk.Align.START} hexpand>
          <Launcher />
          <Workspaces />
          <WinTitle />
        </box>

        <box>
          <Date />
        </box>

        <box hexpand>
          <box halign={Gtk.Align.START} hexpand>
            <SysTray />
          </box>
          <NetworkStatus />
          <AudioLevel />
          <BatteryLevel />
        </box>
      </centerbox>
    </window>
  );
}

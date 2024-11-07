const audio = await Service.import("audio");

function changeVolume(type, amount) {
  audio[type].volume += amount;
  if (audio[type].volume > 1) {
    audio[type].volume = 1;
  }

  if (audio[type].volume < 0) {
  }
}

const volume = (type) =>
  Widget.Button({
    on_primary_click: () => (audio[type].is_muted = !audio[type].is_muted),
    class_name: "module-wrapper",
    child: Widget.EventBox({
      on_scroll_up: () => (audio[type].volume += 0.05),
      on_scroll_down: () => (audio[type].volume -= 0.05),
      child: Widget.Box({
        children: [
          Widget.Icon().hook(audio.speaker, (self) => {
            const vol = Math.round(audio[type].volume * 100);
            const icon = [
              [101, "overamplified"],
              [75, "high"],
              [40, "medium"],
              [1, "low"],
              [0, "muted"],
            ].find(([threshold]) => threshold <= vol)?.[1];

            self.icon = `audio-volume-${audio[type].is_muted ? "muted" : icon}-symbolic`;
            self.class_name = "vol-icon";
          }),
          Widget.Label({
            class_name: "vol-label",
            label: audio[type].bind("volume").as((vol) => {
              return `${Math.round(vol * 100)}%`;
            }),
          }),
        ],
      }),
    }),
  });

export const speakerVol = () => volume("speaker");
export const microphoneVol = () => volume("microphone");

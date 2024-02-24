import { defineConfig } from "vitepress";

export default defineConfig({
  title: "samschloegel/qlab-scripts",
  description: "Sam's QLab Scripts",
  base: "/qlab-scripts/",
  themeConfig: {
    nav: [
      { text: "Home", link: "/" },
      { text: "Scripts", link: "/scripts/" },
    ],
    sidebar: [
      {
        text: "Notes",
        items: [
          { text: "How to use", link: "/scripts/how-to" },
          { text: "QLab 5 vs QLab 4", link: "/scripts/version" },
        ],
      },
      {
        text: "Scripts",
        items: [
          { text: "Batch Cue Edits", link: "/scripts/batch-cue-edits" },
          { text: "Console Recalls", link: "/scripts/console-recalls" },
          { text: "Creating Fades", link: "/scripts/create-fades" },
          { text: "Creating Triggers", link: "/scripts/create-triggers" },
          { text: "Level Changes", link: "/scripts/level-changes" },
          { text: "Manage Overrides", link: "/scripts/manage-overrides" },
          { text: "Remote Control of macOS", link: "/scripts/remote-control" },
          { text: "Stem Files Versioning", link: "/scripts/stem-files" },
          { text: "Other Miscellaneous", link: "/scripts/other" },
        ],
      },
    ],
    socialLinks: [
      { icon: "github", link: "https://github.com/samschloegel/qlab-scripts" },
    ],
  },
});

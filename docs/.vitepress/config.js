import { defineConfig } from "vitepress";

export default defineConfig({
  title: "Sam's QLab Scripts",
  description: "",
  base: "/qlab-scripts/",
  srcDir: "src",
  cleanUrls: true,
  themeConfig: {
    nav: [
      { text: "Home", link: "/" },
      { text: "Guide", link: "/guide/" },
    ],
    sidebar: [
      {
        text: "Guide",
        items: [
          { text: "How To", link: "/guide/" },
          { text: "License", link: "/guide/license" },
          { text: "QLab 5 vs QLab 4", link: "/guide/4v5" },
        ],
      },
      {
        text: "Scripts",
        items: [
          {
            text: "Batch Editing",
            collapsed: false,
            items: [
              {
                text: "Using batch editing",
                link: "/scripts/batch-edits/",
              },
              { text: "Arming", link: "/scripts/batch-edits/arming" },
              {
                text: "Names & Numbers",
                link: "/scripts/batch-edits/names-numbers",
              },
              { text: "Colors", link: "/scripts/batch-edits/colors" },
              {
                text: "Levels & Gangs",
                link: "/scripts/batch-edits/levels-gangs",
              },
              {
                text: "Stem File Versioning",
                link: "/scripts/batch-edits/stem-files",
              },
              { text: "Other", link: "/scripts/batch-edits/other" },
            ],
          },

          { text: "Creating Fades, etc.", link: "/scripts/create-cues" },
          {
            text: "Console Recalls",
            collapsed: false,
            items: [
              {
                text: "Yamaha Scenes",
                link: "/scripts/console-recalls/yamaha",
              },
              {
                text: "DiGiCo Snapshots",
                link: "/scripts/console-recalls/digico",
              },
            ],
          },
          { text: "Manage Overrides", link: "/scripts/manage-overrides" },
          { text: "Remote Control of macOS", link: "/scripts/remote-control" },
          { text: "Miscellaneous", link: "/scripts/misc" },
        ],
      },
    ],
    socialLinks: [
      { icon: "github", link: "https://github.com/samschloegel/qlab-scripts" },
    ],
    outline: {
      level: "deep",
    },
    search: {
      provider: "local",
    },
  },
});

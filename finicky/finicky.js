// @ts-check

/**
 * @typedef {import('/Applications/Finicky.app/Contents/Resources/finicky.d.ts').FinickyConfig} FinickyConfig
 */

/**
 * @type {FinickyConfig}
 */
export default {
  defaultBrowser: "Safari",
  options: {
    keepRunning: true
    // urlShorteners: (list) => [...list, "zpl.io"],
  },
  rewrite: [
    {
      // Redirect Reddit links to old.reddit.com
      match: finicky.matchHostnames(["www.reddit.com", "reddit.com"]),
      url(url) {
        const newUrl = new URL(url.toString());
        newUrl.hostname = 'old.reddit.com';
        return newUrl;
      }
    },
  ],
  handlers: [
    {
      // Open MS Teams links in Teams app
      match: finicky.matchHostnames(["teams.microsoft.com"]),
      browser: "com.microsoft.teams",
    },
    {
      // Open Zeplin links in Zeplin app
      match: finicky.matchHostnames(["app.zeplin.io"]),
      browser: "io.zeplin.osx",
    },
    {
      // Open Figma links in Firefox
      match: finicky.matchHostnames(["figma.com", /.+\.figma.com/]),
      browser: "Firefox",
    },
    {
      // Open Miro links in Firefox
      match: finicky.matchHostnames(["miro.com", /.+\.miro.com/]),
      browser: "Firefox",
    },
    {
      // Open Google links in a Safari private window
      match: finicky.matchHostnames(["google.com", /.+\.google.com/]),
      browser: "PrivateWindow",
    },
    {
      // Open YouTube links in a Safari private window
      match: finicky.matchHostnames(["youtube.com", "youtu.be", /.+\.youtube.com/]),
      browser: "PrivateWindow",
    },
    {
      // Open Tailscale links in Firefox
      match: finicky.matchHostnames(["tailscale.com", /.+\.tailscale.com/]),
      browser: "Firefox",
    },
    {
      // Open Linear links in Linear
      match: ["linear.app/klanchman*"],
      browser: "Linear",
    },
  ],
}

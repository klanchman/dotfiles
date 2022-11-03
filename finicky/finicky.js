// Use https://finicky-kickstart.now.sh to generate basic configuration
// Learn more about configuration options: https://github.com/johnste/finicky/wiki/Configuration

module.exports = {
  defaultBrowser: "Safari",
  options: {
    urlShorteners: (list) => [...list, "zpl.io"],
  },
  rewrite: [
    // Redirect Reddit links to old.reddit.com
    {
      match: finicky.matchHostnames(["www.reddit.com", "reddit.com"]),
      url({ url }) {
        return {
          ...url,
          host: 'old.reddit.com',
        }
      }
    },
  ],
  handlers: [
    // Open MS Teams links in Teams app
    {
      match: finicky.matchHostnames(["teams.microsoft.com"]),
      browser: "com.microsoft.teams",
      url({ url }) {
        return {
          ...url,
          protocol: "msteams",
        }
      },
    },
    {
      // Open Zeplin links in Zeplin app
      match: [finicky.matchDomains(/app\.zeplin\.io/)],
      browser: "io.zeplin.osx",
    },
    {
      // Open Figma links in Firefox
      match: ["figma.com*", finicky.matchDomains(/.*\.figma\.com/)],
      browser: "Firefox",
    },
    {
      // Open Miro links in Firefox
      match: ["miro.com*", finicky.matchDomains(/.*\.miro\.com/)],
      browser: "Firefox",
    },
    {
      // Open Google links in Firefox
      match: ["google.com*", finicky.matchDomains(/.*\.google.com/)],
      browser: "Firefox",
    },
    {
      // Open Tailscale links in Firefox
      match: ["tailscale.com*", finicky.matchDomains(/.*\.tailscale.com/)],
      browser: "Firefox",
    },
  ],
}

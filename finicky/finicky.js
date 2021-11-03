// Use https://finicky-kickstart.now.sh to generate basic configuration
// Learn more about configuration options: https://github.com/johnste/finicky/wiki/Configuration

module.exports = {
  defaultBrowser: "Safari",
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
      // Open Figma links in Firefox
      match: ["figma.com*", finicky.matchDomains(/.*\.figma\.com/)],
      browser: "Firefox",
    },
  ],
}

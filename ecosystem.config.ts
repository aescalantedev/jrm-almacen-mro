module.exports = {
    apps: [
      {
        name: "strix-ui",
        script: "node_modules/next/dist/bin/next",
        args: "start -H 0.0.0.0 -p 3059",
        env: {
          NODE_ENV: "production",
        },
      },
    ],
  };
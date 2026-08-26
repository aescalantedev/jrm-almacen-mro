module.exports = {
  apps: [
    {
      name: "mro-app",
      script: "node_modules/next/dist/bin/next",
      args: "start -H 0.0.0.0 -p 3059",
      env: {
        NODE_ENV: "production",
      },
    },
  ],
};

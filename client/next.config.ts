import type { NextConfig } from "next";
import type { Configuration } from "webpack";

const nextConfig: NextConfig = {
  webpackDevMiddleware: (config: Configuration) => {
    config.watchOptions = {
      poll: 1000,           // Check for changes every 1 second
      aggregateTimeout: 300 // Wait 300ms after changes before rebuilding
    };
    return config;
  },
};

export default nextConfig;

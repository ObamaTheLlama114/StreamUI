import tmi from "tmi.js";
import { newchat } from "./prisma";

const client = new tmi.Client({
  channels: ["obamathellama114"],
});
client.connect();
client.on("message", async (channel, tags, message, self) => {
  console.log(tags.username + "> " + message);
  newchat(tags, message);
});

import type { chats, chatters } from "@prisma/client";
import { PrismaClient } from "@prisma/client";
import tmi from "tmi.js";
const prisma = new PrismaClient();

function sleep(time: number) {
  return new Promise((resolve) => setTimeout(resolve, time));
}

export async function newchat(tags: tmi.ChatUserstate, message: string) {
  try {
    try {
      await prisma.chatters.create({
        data: {
          username: tags["display-name"]!,
          color: tags.color,
        },
      });
    } catch {}
    let chatter = (await prisma.chatters.findUnique({
      where: { username: tags["display-name"] },
    }))!;
    await prisma.chats.create({
      data: {
        message: message,
        chatterid: chatter.id,
      },
    });
  } catch (e) {
    console.log(e);
  }
}

export async function getchat() {
  return await prisma.chats.findMany({
    include: {
      chatter: true,
    },
  });
}

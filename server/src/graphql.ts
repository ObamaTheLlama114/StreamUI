import { buildSchema } from "graphql";
import { getchat } from "./prisma";
import { graphqlHTTP } from "express-graphql";

let schema = buildSchema(`
  type Chat {
    message: String!,
    chatter: Chatter!
  }  
  type Chatter {
    color: String,
    username: String!
  }

  type Query {
    chats: [Chat!]
  }
`);

let root = {
  chats: async () => {
    let value = await getchat();
    return value;
  },
};

export let gqhttp = graphqlHTTP({
  schema: schema,
  rootValue: root,
  graphiql: true,
});

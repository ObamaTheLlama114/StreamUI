import "./twitch";
import cors from "cors";
import express from "express";
import { gqhttp } from "./graphql";

let app = express();
app.use(cors());
app.use("/graphql", gqhttp);
app.listen(4000);
console.log("Running a GraphQL API server at http://localhost:4000/graphql");

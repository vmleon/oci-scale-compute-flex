import { createServer } from "http";
import express from "express";
import helmet from "helmet";
import jsonPackage from "./package.json" assert { type: "json" };
import pino from "pino";
import * as dotenv from "dotenv";
import short from "short-uuid";

dotenv.config({ path: "./config/.env" });

const LOG_LEVEL = process.env.LOG_LEVEL || "info";
const logger = pino({ level: LOG_LEVEL });
logger.info(`LOG_LEVEL: ${LOG_LEVEL}`);

const NODE_ENV = process.env.NODE_ENV || "production";
logger.info(`NODE_ENV: ${NODE_ENV}`);

const PORT = parseInt(process.env.PORT || 3000);
logger.info(`PORT: ${PORT}`);

logger.info(`Version ${jsonPackage.version}`);

const serverId = short.generate().slice(0, 3);
logger.info(`Server id: ${serverId}`);

const app = express();
app.use(helmet());

app.use(express.json());

app.get("/", async (req, res) => {
  logger.info(`GET /`);
  res.send({
    id: serverId,
    name: jsonPackage.name,
    version: jsonPackage.version,
    message: "hello",
  });
});

const httpServer = createServer(app);

httpServer.listen(PORT, () =>
  logger.info(`Server ${serverId} listening on port ${PORT}`)
);

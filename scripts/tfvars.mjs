#!/usr/bin/env zx

import Mustache from "mustache";
import { readEnvJson } from "./lib/utils.mjs";

const shell = process.env.SHELL | "/bin/zsh";
$.shell = shell;
$.verbose = false;

const { compartmentId, compartmentName, regionName, tenancyId, publicKeyPath } =
  await readEnvJson();

const tfVarsPath = "terraform/terraform.tfvars";

const tfvarsTemplate = await fs.readFile(`${tfVarsPath}.mustache`, "utf-8");

const output = Mustache.render(tfvarsTemplate, {
  tenancyId,
  regionName,
  compartmentId,
  publicKeyPath: publicKeyPath,
});

console.log(
  `Terraform will deploy resources in ${chalk.yellow(
    regionName
  )} in compartment ${
    compartmentName ? chalk.yellow(compartmentName) : chalk.yellow("root")
  }`
);

await fs.writeFile(tfVarsPath, output);

console.log(`File ${chalk.yellow(tfVarsPath)} created`);

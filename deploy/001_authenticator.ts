import { DeployFunction } from "hardhat-deploy/types";
import { HardhatRuntimeEnvironment } from "hardhat/types";

import { CONTRACT_NAMES, SALT } from "../src/deploy";

const deployAuthenticator: DeployFunction = async function ({
  deployments,
  getNamedAccounts,
}: HardhatRuntimeEnvironment) {
  const { deployer, owner, manager } = await getNamedAccounts();
  const { deploy } = deployments;

  const { authenticator } = CONTRACT_NAMES;
  await deploy(authenticator, {
    from: deployer,
    gasLimit: 2000000,
    deterministicDeployment: SALT,
    log: true,
    proxy: {
      owner,
      methodName: "initializeManager",
    },
    args: [manager],
  });
};

deployAuthenticator.tags = ['001']
export default deployAuthenticator;

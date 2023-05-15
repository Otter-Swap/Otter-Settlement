import { HardhatRuntimeEnvironment } from "hardhat/types";

import { Interaction } from "../../src";
import { Erc20Token } from "../ts/tokens";

import { Erc20Decoder } from "./interaction/erc20";
import { InteractionDecoder } from "./interaction/template";
import { UniswapLikeDecoder } from "./interaction/uniswap_like";


// Decoded calldata of a function call.
export interface DecodedInteractionCall {
  functionName: string;
  // args is null in case of a decoding error.
  args: Map<string, string> | null;
}

export interface DecodedInteraction {
  targetName: string;
  // call is null in case the decoder does not support the function used in the
  // interaction
  call: DecodedInteractionCall | null;
}

// eslint-disable-next-line @typescript-eslint/no-empty-interface
export interface DecodingTools {
  tokenRegistry?: Record<string, Erc20Token>;
  settlementContractAddress?: string;
}

export async function decode(
  interaction: Interaction,
  hre: HardhatRuntimeEnvironment,
  decodingTools: DecodingTools = {},
): Promise<DecodedInteraction | null> {
  const decoders: InteractionDecoder[] = [
    new UniswapLikeDecoder(hre),
    new Erc20Decoder(hre),
  ];

  try {
    // TODO: use Promise.any when better supported by our tooling
    const decoded = (
      await Promise.allSettled(
        decoders.map((decoder) => decoder.decode(interaction, decodingTools)),
      )
    ).filter(
      (result) => result.status === "fulfilled" && result.value !== null,
    ) as PromiseFulfilledResult<DecodedInteraction>[];

    return decoded[0]?.value ?? null;
  } catch {
    // no valid decoding found
    return null;
  }
}

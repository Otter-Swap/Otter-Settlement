import { TypedDataDomain } from "./types/ethers";

/**
 * Return the Otter domain used for signing.
 * @param chainId The EIP-155 chain ID.
 * @param verifyingContract The address of the contract that will verify the
 * signature.
 * @return An EIP-712 compatible typed domain data.
 */
export function domain(
  chainId: number,
  verifyingContract: string,
): TypedDataDomain {
  return {
    name: "Otter Protocol",
    version: "v2",
    chainId,
    verifyingContract,
  };
}

export * from "./api";
export * from "./deploy";
export * from "./interaction";
export * from "./order";
export * from "./proxy";
export * from "./reader";
export * from "./settlement";
export * from "./sign";
export * from "./signers";
export * from "./swap";
export * from "./vault";
export * from "./types/ethers";

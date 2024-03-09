# AssetXchange
### About Smart Contract:
#### The MyToken contract is designed to demonstrate the capabilities of the ERC1155 standard for managing both fungible and non-fungible tokens. The contract is extendable and can be customized for various use cases, including digital collectibles, gaming items, and more.
#### Features: **Token Initialization:** At deployment, the constructor mints two types of tokens to the deployer's address <br/> 10^18 units of token ID 1, representing a fungible token that could be used similarly to a currency or points system. <br/>1 unit of token ID 2, representing a non-fungible token that could be a unique asset or collectible.<br/>The ERC1155("https://my.api.com/{id}.json") part specifies the metadata URI template that clients can use to fetch token metadata. The {id} placeholder is replaced with the actual token ID to obtain metadata for each specific token type.<br/>**Minting:** The mint function allows the caller to mint new tokens of a specified ID to any account. This function includes a security check to ensure only the owner (or authorized accounts, depending on your contract's logic) can mint new tokens, thereby preventing unauthorized token creation.<br/>**Burning:** The burn function enables token holders to destroy their tokens, effectively reducing the supply. Like minting, burning requires that the caller is the owner of the tokens, ensuring that tokens cannot be burned by unauthorized parties.
#### Usage: <br/>The MyToken contract can serve as a foundational element for projects that require a flexible token solution capable of supporting a wide range of assets under a unified standard. Whether for tracking in-game items, creating a platform for digital collectibles, or issuing tokens for a rewards system, MyToken provides a solid starting point for development.




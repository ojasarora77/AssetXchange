import { createThirdwebClient } from 'thirdweb';

// Replace this with your client ID string
// refer to https://portal.thirdweb.com/typescript/v5/client on how to get a client ID
const clientId = "1vEZ5PRxicCnGlQp0WYwafxRCgS13swmG4D3DjfV6pknaZPxvRACy2rnB29r28z62z1MqqxdJpL2XYXyzp9Mhw"

if (!clientId) {
	throw new Error('No client ID provided');
}

export const client = createThirdwebClient({
	clientId: clientId,
});

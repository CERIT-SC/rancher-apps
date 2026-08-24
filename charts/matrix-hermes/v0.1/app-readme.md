# Matrix Hermes Agent

Deploys a [Hermes Agent](https://hermes-agent.nousresearch.com/) instance that can be connected to the
[CERIT-SC Matrix platform](https://docs.cerit.io/en/docs/web-apps/matrix).

## Prerequisites

- Your own OpenAI API key.

## Setup steps

1. Prepare your own OpenAI API key.
2. Go to Matrix and create a **private, non-encrypted** room (this is important — the agent cannot send and receive files from/to encrypted rooms). Enter the room and remember its name/ID. It will look something like:
   `!KeNOYaqpyGQN:matrix.cloud.e-infra.cz`
3. Go to https://app.matrix.cloud.e-infra.cz/, log in, and it shows you an env block that looks like:

   ```
   MATRIX_HOMESERVER=https://matrix.cloud.e-infra.cz
   MATRIX_USER_ID=@agent-xhejtman-1:matrix.cloud.e-infra.cz
   MATRIX_ACCESS_TOKEN=xxx
   MATRIX_DEVICE_ID=xxx
   MATRIX_E2EE_MODE=required
   MATRIX_RECOVERY_KEY_OUTPUT_FILE=~/.hermes/recovery-keys/agent-xhejtman-1.key
   # Invite @agent-xhejtman-1:matrix.cloud.e-infra.cz to a room, then @mention it or add the room to
   # MATRIX_FREE_RESPONSE_ROOMS.
   MATRIX_ALLOWED_USERS=@xhejtman:matrix.cloud.e-infra.cz
   ```

4. Copy-paste this env block into the install/upgrade form of this application together with the room ID and your API key, and start the application.
5. Invite the agent user (your `MATRIX_USER_ID`, here `@agent-xhejtman-1:matrix.cloud.e-infra.cz`) into the room from step 2, then @mention it to talk to it.

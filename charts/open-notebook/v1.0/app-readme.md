# Open Notebook

An open source, privacy-focused alternative to Google's Notebook LM!

Open Notebook empowers you to:
- **Control your data** - Keep your research private and secure
- **Choose your AI models** - Support for 16+ providers including OpenAI, Anthropic, Ollama, LM Studio, and more
- **Organize multi-modal content** - PDFs, videos, audio, web pages, and more
- **Generate professional podcasts** - Advanced multi-speaker podcast generation
- **Search intelligently** - Full-text and vector search across all your content
- **Chat with context** - AI conversations powered by your research

Learn more at [https://www.open-notebook.ai](https://www.open-notebook.ai)

## Configuration

### Application URL
The application URL is automatically generated as `https://open-notebook.{namespace}.dyn.cloud.e-infra.cz`. You can specify a custom URL if needed.

### Authentication
Set an admin password during installation. This password protects your Open Notebook instance.

### AI Provider (e-INFRA CZ)
The AI provider is **preconfigured** to use the e-INFRA CZ LLM service at `https://llm.ai.e-infra.cz/v1`.

To obtain your API key:
1. Visit [https://chat.ai.e-infra.cz](https://chat.ai.e-infra.cz)
2. Log in with your institution credentials
3. Generate your personal API key

For more information, see the [documentation](https://docs.cerit.io/en/docs/ai-as-a-service/ai-api).

Enter your API key in the `LLM API Key` field during installation. You can also use your own OpenAI-compatible provider by changing the LLM Base URL.

## Storage

The application uses two persistent volumes:
- **Open Notebook data** - Stores notebooks, sources, and user data
- **SurrealDB data** - Stores the database

Both volumes are preserved across application upgrades.

## Access

Once deployed, access Open Notebook via the URL shown in the application endpoints. The default URL follows the pattern:
`https://open-notebook.{namespace}.dyn.cloud.e-infra.cz`

## First Steps

1. Access the application via the provided URL
2. You will see a notification **"API key migration available"** indicating that 1 provider has API keys set via environment variables. Click the **"Go to Settings"** button.
3. On the Settings page, you will see **"Environment Variables Detected"** message indicating 1 API key is configured via environment variables. Click the **"Migrate to Database"** button.
4. You will see an **"OpenAI Compatible"** box that is pre-configured with the e-INFRA CZ endpoint. Click **"Models"**.
5. Select some language models from the list and add them.
6. Switch the model type to **"embedding"** and select the **"qwen3-embedding-4b"** model for embeddings, then add it.
7. In the **"Default Model Assignments"** box, select appropriate models for each task (Chat, Summarize, Transcribe, etc.).
8. Your Open Notebook is now ready to use! Create your first notebook and start adding sources.

For more information, visit the [documentation](https://github.com/lfnovo/open-notebook/tree/main/docs).

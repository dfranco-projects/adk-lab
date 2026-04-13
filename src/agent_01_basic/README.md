# 01 - The Basic Agent

This is the simplest possible implementation of an AI agent using the Agent Development Kit (ADK). We provide two ways to build this agent to show the flexibility of ADK: **Python-first** and **Config-first (YAML)**.

Both implementations do exactly the same thing: they define an agent named `basic_agent`, give it a model (`gemini-2.5-flash`), and set a fundamental instruction prompt. They do **not** have tools, workflows, or any complex state management yet—just a pure LLM ready to chat.

## Prerequisites: Google API Key

Before running any agent that relies on a Gemini model, you need a Google API key.

1. Go to [Google AI Studio](https://aistudio.google.com/).
2. Click **Get API key** and generate a new key.
3. Add it to your `.env` file at the root of the project:
   ```env
   GOOGLE_API_KEY="your-api-key-here"
   ```

## Folder Structure

ADK automatically determines how to load an agent based on the folder contents. We've split this example into two sub-agents to demonstrate this:

```text
agent_01_basic/
  basic_agent_python/
    __init__.py       # Exposes the main agent (e.g. `from .agent import root_agent`)
    agent.py          # The Agent definition and prompts
  basic_agent_yaml/
    root_agent.yaml   # Config-first agent definition
```

### 1. Python Implementation (`basic_agent_python/`)
This uses the standard `Agent` class in `agent.py`. By placing `from .agent import root_agent` in `__init__.py`, ADK treats the folder as a runnable Python module.

### 2. YAML Implementation (`basic_agent_yaml/`)
ADK also supports a no-code "Agent Config" approach. By simply placing a `root_agent.yaml` in a directory, ADK parses it and dynamically creates an agent under the hood.

> **Limitations of YAML Agents:**
> While its more clean for simple agents, the YAML feature is experimental and currently has limitations:
> - **Models**: Currently only supports Gemini models (third-party integration is in progress).
> - **Agent Types**: Advanced routing agents like `LangGraphAgent` and `A2aAgent` are not supported.
> - **Tools**: Certain complex tools (like `LongRunningFunctionTool`, `VertexAiSearchTool`, or `McpToolset`) have limited or no support via YAML config yet.

## Running the Agents

### `adk web` (Visual UI)
The easiest way to test your agent, view traces of its thought process, and save evaluation test cases.

Run the web server from the project root pointing at the master directory:
```bash
adk web src/agent_01_basic
```
Since `agent_01_basic` contains two sub-directories (`basic_agent_python` and `basic_agent_yaml`), the ADK web UI will detect both of them. Open your browser to `http://localhost:8080` to interact with them side-by-side.

Press `CTRL+C` to quit.

### `adk run` (Terminal REPL)
If you just want a fast, text-based interactive chat right inside your terminal, point directly at the sub-agent you want to run:

```bash
adk run src/agent_01_basic/basic_agent_python
# OR
adk run src/agent_01_basic/basic_agent_yaml
```
Type your message, hit Enter, and type `exit` when you're done.

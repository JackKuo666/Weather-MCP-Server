# Generated by https://smithery.ai. See: https://smithery.ai/docs/config#dockerfile
FROM python:3.10-slim

# Set work directory
WORKDIR /app

# Copy local code to the container image
COPY . /app

# Create virtual environment and install requirements
RUN python -m venv .venv \
    && . .venv/bin/activate \
    && pip install --upgrade pip \
    && pip install httpx "mcp[cli]>=1.4.1"

# Expose port if necessary (adjust if server uses a specific port)
EXPOSE 8080

# Command to run the MCP server using the virtual environment Python interpreter
CMD [".venv/bin/python", "weather.py"]

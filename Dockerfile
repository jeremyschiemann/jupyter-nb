FROM python:3.11-slim

RUN apt-get update && apt-get install -y curl && \
    curl -sSL https://install.python-poetry.org | python3 -

WORKDIR /app

# Copy your Python project files to the container (if you have any)
# COPY . /app

Install your project dependencies with Poetry
RUN poetry config virtualenvs.create false && poetry install && rm -rf /root/.cache/pypoetry

# Define the command to run when the container starts
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root"]

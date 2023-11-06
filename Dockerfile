FROM python:3.11-slim

RUN apt-get update && apt-get install -y curl && \
    curl -sSL https://install.python-poetry.org | python3 -

ENV PATH="/root/.local/bin:$PATH"

WORKDIR /setup
COPY pyproject.toml poetry.lock /setup/
RUN poetry config virtualenvs.create false && poetry install && rm -rf /root/.cache/pypoetry

WORKDIR /app
# Define the command to run when the container starts
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root"]

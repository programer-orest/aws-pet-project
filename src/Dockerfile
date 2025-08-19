# Stage 1: The Build Stage
ARG PYTHON_VERSION=3.11-slim
FROM python:${PYTHON_VERSION} AS builder

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# System dependencies for building mysqlclient
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc build-essential pkg-config default-libmysqlclient-dev \
 && rm -rf /var/lib/apt/lists/*

# Copy only requirements.txt for caching
COPY requirements.txt .
RUN pip install --upgrade pip && \
  pip wheel --no-cache-dir --wheel-dir /wheels -r requirements.txt


# Stage 2: The Run Stage
FROM python:${PYTHON_VERSION} AS run

WORKDIR /app

# Library for connection with MySQL
RUN apt-get update && apt-get install -y --no-install-recommends \
    default-libmysqlclient-dev \
&& rm -rf /var/lib/apt/lists/*

# Copy the wheels from the builder stage
COPY --from=builder /wheels /wheels
RUN pip install --no-cache-dir /wheels/* && rm -rf /wheels

# Copy the application code
COPY . .

# Convert plain text files from Windows or Mac format to Unix format
RUN apt-get update && apt-get install -y dos2unix \
&& rm -rf /var/lib/apt/lists/*
RUN dos2unix --newfile docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]



FROM ubuntu:22.04

# Install required dependencies
RUN apt-get update && \
    apt-get install -y curl jq git sudo unzip libicu70 && \
    apt-get clean

# Create 'runner' user
RUN useradd -m runner && \
    mkdir -p /runner && \
    chown runner:runner /runner

WORKDIR /runner

USER runner

# Download and extract the GitHub Actions runner
RUN curl -o actions-runner.tar.gz -L https://github.com/actions/runner/releases/download/v2.312.0/actions-runner-linux-x64-2.312.0.tar.gz && \
    tar xzf actions-runner.tar.gz && \
    rm actions-runner.tar.gz

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

FROM python:3.11-slim-bullseye AS builder
WORKDIR /app
RUN apt-get update && \
    apt-get install -y git && \
    pip install --upgrade pip
RUN git clone https://github.com/patrickchugh/terravision.git ./
RUN pip install --no-cache-dir -r requirements.txt


FROM python:3.11-slim-bullseye
LABEL org.opencontainers.image.title="Docker image Terravision" \
      org.opencontainers.image.description="Terravision creates Professional Cloud Architecture Diagrams from your Terraform code automatically. Supports AWS, Google and Azure.Build from Argenis Ochoa. <linux8a@gmail.com> " \
      org.opencontainers.image.licenses="GPL v2.0"
WORKDIR /app
RUN apt-get update && \
    apt-get install --no-install-recommends -y git && \
    rm -rf /var/lib/apt/lists/*
COPY --from=builder /app /app
COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
RUN chmod +x terravision
RUN useradd -m terravision
USER terravision
ENTRYPOINT ["./terravision"]
CMD ["--version"]

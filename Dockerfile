# Используйте официальный образ Python
FROM python:3.9-slim-buster

# Обновите pip и установите зависимости Python в одной команде
RUN pip install --upgrade pip && \
    pip install ansible six jmespath

# Обновите список пакетов и установите системные зависимости в одной команде,
# затем удалите кэш apt для уменьшения размера образа
RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    sshpass openssh-client git && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /work
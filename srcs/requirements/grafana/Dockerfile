FROM debian:11

ARG GRAFANA_USER_NAME
ARG GRAFANA_PWD

# Installation des paquets nécessaires et configuration du repository Grafana (partie qui change rarement)
RUN apt-get update && apt-get install -y \
    vim \
    wget \
    apt-transport-https \
    software-properties-common \
    gnupg2 \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /etc/apt/keyrings/ \
    && wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | tee /etc/apt/keyrings/grafana.gpg > /dev/null \
    && echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | tee -a /etc/apt/sources.list.d/grafana.list

# Installation de Grafana
RUN apt-get update && apt-get install -y grafana && rm -rf /var/lib/apt/lists/*

# Configuration des variables d'environnement (partie qui peut changer)
ENV GF_SECURITY_ADMIN_USER=${GRAFANA_USER_NAME}
ENV GF_SECURITY_ADMIN_PASSWORD=${GRAFANA_PWD}
ENV GF_USERS_ALLOW_SIGN_UP=false

EXPOSE 3000

CMD ["grafana-server", "--homepath=/usr/share/grafana", "--config=/etc/grafana/grafana.ini"]



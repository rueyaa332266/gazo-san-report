FROM lifullsetg/gazo-san:latest
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /

RUN apt-get update \
    && apt install -y nodejs npm wget gnupg \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y nginx google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf libxss1 \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN npm i puppeteer \
    && groupadd -r pptruser && useradd -r -g pptruser -G audio,video pptruser

RUN mkdir /report
WORKDIR /app
COPY docker/ ./
RUN mv nginx.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT ["bash", "/app/entrypoint.sh"]
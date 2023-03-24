FROM ghcr.io/vvakame/review:5.7
WORKDIR /work
COPY . /work
RUN npm install
ENV PATH $PATH:/work/node_modules/.bin

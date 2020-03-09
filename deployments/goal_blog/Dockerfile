FROM node:latest

COPY credentials.csv /credentials.csv

RUN npm install -g tiddlywiki
RUN tiddlywiki --version
RUN tiddlywiki goalblog --init server
# CMD ["tiddlywiki", "goalblog", "--listen", "host=0.0.0.0"]
CMD ["tiddlywiki", "goalblog", "--listen", "host=0.0.0.0", "credentials=/credentials.csv"]

FROM node:16-alpine3.13

WORKDIR /app

COPY package.json ./
COPY public ./public
COPY src  ./src

RUN npm install; npm run build 

EXPOSE 3000

CMD ["npm", "run", "start"]

#docker build -t awscicd:latest .
#docker images ls
#docker run -t -i -p 8080:3000 awscicd:latest
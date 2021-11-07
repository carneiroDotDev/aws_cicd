FROM node:latest

WORKDIR '/app'

COPY package.json ./
ADD public ./public
ADD src  ./src

RUN npm install 
RUN npm run build 

EXPOSE 3000

CMD ["npm", "run", "start"]

#docker build -t awscicd:latest .
#docker images ls
#docker run -t -i -p 8080:3000 awscicd:latest
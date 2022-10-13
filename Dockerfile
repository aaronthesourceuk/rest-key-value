FROM node

COPY . /

EXPOSE 3000

RUN npm install
# Development
CMD npm run watch
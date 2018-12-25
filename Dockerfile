FROM arm32v7/node

# Create app directory
WORKDIR /ezhai24/rpi-server

# Install app dependencies
COPY package*.json ./
RUN npm install

# Bundle app source
COPY . .

EXPOSE 20000
CMD [ "npm", "start" ]
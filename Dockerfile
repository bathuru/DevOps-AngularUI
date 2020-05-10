# pull official base image
FROM node:13.12.0-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# Copies package.json and package-lock.json to Docker environment
COPY package.json ./
COPY package-lock.json ./

# Installs all node packages
RUN npm install --silent

# add app
COPY . ./

# Uses port which is used by the actual application
EXPOSE 3000

# start app
CMD ["npm", "start"]

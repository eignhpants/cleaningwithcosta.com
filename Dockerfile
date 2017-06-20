# Pull base image from stock node image.
FROM node:4.4.7-wheezy

RUN groupadd -r app && useradd -r -g app app
ENV PATH="./node_modules/.bin:${PATH}"


COPY package.json package.json
RUN npm install

# Set the current working directory to the new mapped folder.
ADD . /usr/src/app
WORKDIR /usr/src/app

# Install your application's dependencies

# Expose the node.js port to the Docker host.
EXPOSE 3334


# This is the stock express binary to start the app.
CMD [ "make", "run" ]

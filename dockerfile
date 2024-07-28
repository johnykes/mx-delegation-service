FROM node:18
# Create app directory
WORKDIR /usr/src/app
COPY package*.json ./
RUN yarn install --network-timeout 600000
# Bundle app source
COPY . .
# COPY .env .env.development ./

# Creates a "dist" folder with the production build
RUN yarn build

# Expose the port on which the app will run
EXPOSE 3005
EXPOSE 4001

# Start the server using the production build
# CMD ["npm", "run", "start:prod"]
CMD ["yarn", "start:prod"]
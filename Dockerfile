FROM node:12-alpine

# Install dependencies
WORKDIR /data

COPY ./package.json /data/package.json

# RUN npm init --yes \
RUN    npm install noflo --save \
    && npm install noflo-nodejs --save \
    && npm install noflo-core --save \
    && npm install noflo-filesystem --save

# The secret password is sent to flowhub directly, don't use anything private
ENV SECRET_PASSWORD some_password

EXPOSE 3569
# CMD /bin/sh
CMD ["/bin/sh", "-c", "node node_modules/.bin/noflo-nodejs --secret $SECRET_PASSWORD"]
# CMD "node node_modules/.bin/noflo-nodejs --secret $SECRET_PASSWORD"

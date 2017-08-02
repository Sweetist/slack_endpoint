FROM 213273172953.dkr.ecr.eu-west-1.amazonaws.com/ruby_base:latest
MAINTAINER Harsh Shah, harshit.shah@surfdome.com

# Create app directory
RUN mkdir -p /app
WORKDIR /app

# Bundle dependencies
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install --without development test

# ADD the App
ADD . /app

EXPOSE 80 3000

# Copy docker-entrypoint.sh
ADD ./docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Start the App
ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["start"]

# Base image: Ruby with necessary dependencies for Jekyll
FROM ruby

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    nodejs \
    nginx \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy Gemfile into the container (necessary for `bundle install`)
COPY Gemfile ./

# Install bundler and dependencies
RUN gem install bundler && bundle install

# Expose port 4000 for Jekyll server
EXPOSE 4000

# # Command to serve the Jekyll site
# CMD ["bundle", "exec", "jekyll", "serve", "--watch", "--host", "0.0.0.0"]
CMD ["bash"]
# define ruby image to use in our image
FROM ruby:2.7.1

# add yarn to package list
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# install psql client, nodejs, and yarn
RUN apt-get update -qq && apt-get install -y postgresql-client yarn

# specify everything will happen within the /credly-take-home folder inside the container
RUN mkdir credly-take-home
WORKDIR /credly-take-home

# copy Gemfiles from current application to the /credly-take-home container
COPY Gemfile /credly-take-home
COPY Gemfile.lock /credly-take-home

# install dependencies
RUN bundle install

# copy yarn.lock from current application to /credly-take-home container
COPY package.json ./

RUN yarn install

# copy files current application to the /credly-take-home container
COPY . /credly-take-home

# expose port 5000
EXPOSE 5000

# start rails server
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "5000"]

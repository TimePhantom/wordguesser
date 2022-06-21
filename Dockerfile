FROM ruby:2.6.6

COPY . /wordguesser
WORKDIR /wordguesser
RUN bundle install

# this will be ignored by heroku
EXPOSE 3000

# these ensure (for heroku) that we can run as non-root user
RUN useradd -m myuser
USER myuser

# execution list precludes use of variable
CMD ["bundle", "exec", "rackup", "-o", "0.0.0.0", "-p", "$PORT"]
#CMD bundle exec rackup -o 0.0.0.0 -p $PORT
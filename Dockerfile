FROM  ruby:2.6

LABEL maintainer="dinko@poliglota.cl"

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends nodejs build-essential

ADD Gemfile /usr/src/app/
ADD Gemfile.lock /usr/src/app/

WORKDIR /usr/src/app/

ADD . /usr/src/app/

RUN bundle install

CMD ["bin/rails", "s", "-b", "0.0.0.0"]


FROM bitnami/ruby:2.4

RUN apt-get update \
  && apt-get install -y build-essential cmake git libpq-dev libxml2-dev \
    libsasl2-dev libxml2-utils graphicsmagick libxslt1-dev --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

ENV RACK_ENV="production"

RUN gem install sinatra ruby-kafka --no-rdoc --no-ri 

ADD kubeless.rb /

CMD ["ruby", "/kubeless.rb"]

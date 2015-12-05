FROM scratch
ADD rootfs.tar /

RUN curl -L -o /tmp/rubygems.zip https://rubygems.org/rubygems/rubygems-2.5.0.zip && \
  cd /tmp && \
  unzip rubygems.zip && \
  cd rubygems-* && \
  ruby setup.rb --no-document && \
  rm -rf /tmp/*

RUN gem install process_helper -v 0.0.3 --no-ri --no-rdoc

CMD ["/bin/sh"]

FROM scratch
ADD rootfs.tar /

ADD bashrc /root/.bashrc
ENV HOME /root
ENV ENV $HOME/.bashrc

RUN wget http://production.cf.rubygems.org/rubygems/rubygems-2.4.6.zip -O /tmp/rubygems.zip && \
  cd /tmp && \
  unzip rubygems.zip && \
  cd rubygems-* && \
  ruby setup.rb --no-document && \
  rm -rf /tmp/*

CMD ["/bin/sh"]

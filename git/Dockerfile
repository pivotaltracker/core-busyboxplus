FROM            scratch
ADD             rootfs.tar /

# Setup and source bashrc for tab-complete, shell coloring
ADD             bashrc /root/.bashrc
ENV             HOME /root
ENV             ENV $HOME/.bashrc

# Can't `git pull` unless we set these
WORKDIR         /root
RUN             git config --global user.email "git@localhost" &&\
                git config --global user.name "git"

CMD             ["/bin/sh"]

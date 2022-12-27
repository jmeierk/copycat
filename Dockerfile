FROM openjdk:8-buster

RUN apt-get -y update
RUN apt-get install -y libxext-dev libxrender-dev libxtst-dev

# GNU Scientific Library (GSL)
RUN apt-get install -y libgsl23

# AxPcoords (GSL version) expects a libgsl.so.0 ...
RUN ln -s /usr/lib/x86_64-linux-gnu/libgsl.so.23 /usr/lib/x86_64-linux-gnu/libgsl.so.0

ARG USER_ID
ARG GROUP_ID

RUN addgroup --gid $GROUP_ID copycatuser
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID copycatuser

USER copycatuser

CMD java -Xmx2048M -jar Copycat.jar

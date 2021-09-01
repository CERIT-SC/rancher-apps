FROM debian:buster as builder

RUN apt update && apt install -y --no-install-recommends \
			g++ \
			libopenmpi-dev \
			&& rm -rf /var/lib/apt/lists/*

COPY pi.cc /src/pi.cc
RUN mpic++ /src/pi.cc -o /pi


FROM debian:buster

RUN apt update && apt install -y --no-install-recommends \
			openmpi-bin \
                        ibverbs-providers \
                        infiniband-diags \
                        perftest \
                        less \
                        vim \
			openssh-server \
			openssh-client \
		        strace \
			&& rm -rf /var/lib/apt/lists/*
# Add priviledge separation directoy to run sshd as root.
RUN mkdir -p /var/run/sshd

RUN useradd -m mpiuser
WORKDIR /home/mpiuser
COPY sshd_config /etc/ssh/
RUN sed -i 's/[ #]\(.*StrictHostKeyChecking \).*/ \1no/g' /etc/ssh/ssh_config
RUN sed -i 's/.*Port 22.*/   Port 2222/g' /etc/ssh/ssh_config
COPY --from=builder /pi /home/mpiuser/pi

FROM pihole/pihole:latest

RUN apt update && \
    apt install --no-install-recommends -y unbound && \
    apt clean autoclean && \
    apt remove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

COPY config/unbound.conf /etc/unbound/unbound.conf.d/pi-hole.conf

COPY config/entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT ./entrypoint.sh
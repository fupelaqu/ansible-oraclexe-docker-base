FROM ubuntu14.04-oraclexe:{{oracle_xe_version}}

# Add playbooks to the Docker image
ADD site.yml /tmp/site.yml
ADD roles /tmp/
ADD {{module}}.dmp.zip /tmp/

WORKDIR /tmp

# Run Ansible to configure the Docker image
RUN ansible-playbook site.yml -c local -e docker=yes && \
    rm -rf /tmp/*

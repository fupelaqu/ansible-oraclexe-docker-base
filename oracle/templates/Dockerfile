FROM {{oracle_xe_base_image}}:{{oracle_xe_version}}

# Add playbooks to the Docker image
ADD site.yml /tmp/site.yml
ADD roles /tmp/
{% if oracle_pump.stat.exists %}
ADD {{module}}.dmp.zip /tmp/
{% endif %}

WORKDIR /tmp

# Run Ansible to configure the Docker image
RUN ansible-playbook site.yml -c local -e docker=yes && \
    rm -rf /tmp/*

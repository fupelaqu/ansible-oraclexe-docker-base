FROM {{ansible_base_image}}

# Add playbooks to the Docker image
ADD site.yml /tmp/site.yml
ADD roles /tmp/
ADD oracle-xe-*.rpm /tmp/

WORKDIR /tmp

# Run Ansible to configure the Docker image
RUN ansible-playbook site.yml -c local -e docker=yes && \
    rm -rf /tmp/*

ENV ORACLE_HOME /u01/app/oracle/product/11.2.0/xe
ENV ORACLE_SID  XE
ENV PATH        $ORACLE_HOME/bin:$PATH

EXPOSE 1521
EXPOSE 8080

# Run script
ADD start.sh /
RUN chmod u+x /start.sh
CMD /start.sh

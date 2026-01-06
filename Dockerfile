# Imagem Red Hat UBI com OpenJDK (boa para OpenShift)
FROM registry.access.redhat.com/ubi9/openjdk-17-runtime

WORKDIR /opt/app

# Copia o JAR já compilado
COPY target/*.jar app.jar

# OpenShift roda com UID aleatório; garanta permissão para o grupo 0 (root group)
# Assim qualquer UID aleatório pertencente ao grupo 0 consegue ler/executar e escrever (se precisar).
RUN chgrp -R 0 /opt/app && \
    chmod -R g=u /opt/app

EXPOSE 8080

# Roda como UID arbitrário (não fixa user)
ENTRYPOINT ["java","-jar","/opt/app/app.jar"]

FROM eclipse-temurin:21-jre

WORKDIR /app

# usuário não-root (boa prática)
RUN useradd -m appuser
USER appuser

# copia o jar já gerado pelo Maven
COPY target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app/app.jar"]

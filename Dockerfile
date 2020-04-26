FROM registry.access.redhat.com/ubi8/ubi-minimal

# Some version information
LABEL io.k8s.description="Platform for running plain Java applications (fat-jar and flat classpath)" \
      io.k8s.display-name="My Simple Spring Boot App Employee Management" \
      io.openshift.tags="builder,java" \
      com.redhat.dev-mode="JAVA_DEBUG:false" \
      com.redhat.dev-mode.port="JAVA_DEBUG_PORT:5005"
 
# Install Java runtime
RUN microdnf install java-11-openjdk-headless \
 && microdnf install shadow-utils && microdnf clean all \
 && mkdir /deployments
 
EXPOSE 8080 

VOLUME /tmp
COPY target/employeeman-1.0.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]

pipeline {
  node {
  stage('Build Employee Management') {
    openshift.withCluster() {
      openshift.withProject("employeeman") {
        openshift.selector("bc", "employeeman").startBuild("--wait=true")
      }
    }
  }
  stage('Tag Image') {
    echo 'Taging image'  
    openshift.withCluster() {
      openshift.withProject("employeeman") {
        openshift.tag("employeeman:latest", "employeeman:v${BUILD_NUMBER}.0")
      }
    }
  }
  stage('Deploy new image for Employee Management') {
    openshift.withCluster() {
      openshift.withProject("employeeman") {
        openshift.selector("dc", "employeeman").rollout().latest();
      }
    }
  }
}
}

pipeline {
    agent any
    environment {
        ANSIBLE_HOST_KEY_CHECKING = 'False'
    }
    stages {
        stage('Run Apache Playbook') {
            steps {
                sh 'ansible-playbook -i inventory install-apachee2.yml'
            }
        }

        stage('Run Nginx Playbook') {
            steps {
                sh 'ansible-playbook -i inventory install_nginx.yml'
            }
        }

        stage('Run VSFTPD Playbook') {
            steps {
                sh 'ansible-playbook -i inventory vsftpd_install.yml'
            }
        }
    }
}


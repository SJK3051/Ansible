pipeline {
    agent any

    stages {
        stage('Checkout from GitHub - main branch') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/SJK3051/Ansible.git',
                    credentialsId: 'Ansible-task-pipeline'
            }
        }

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

    post {
        failure {
            echo '❌ One or more playbooks failed!'
        }
        success {
            echo '✅ All playbooks ran successfully!'
        }
    }
}

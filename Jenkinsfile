pipeline {
    agent any
    environment {
        ANSIBLE_HOST_KEY_CHECKING = 'False'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git credentialsId: 'Ansible-task-pipeline',
                    url: 'https://github.com/SJK3051/Ansible.git'
            }
        }

        stage('Verify Inventory & Connection') {
            steps {
                echo '=== Printing inventory ==='
                sh 'cat inventory'
                echo '=== Pinging hosts ==='
                sh 'ansible -i inventory Install -m ping'
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
            echo '❌ Deployment failed. Check the logs above.'
        }
        success {
            echo '✅ Deployment completed successfully!'
        }
    }
}


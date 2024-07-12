---
- name: update and install and httpd
  hosts: all
  become: true

  tasks:
   
  - name: Upgrade all packages
    yum:
     name: '*'
     state: latest
      
  - name: Install the latest version of Apache
    yum:
     name: httpd
     state: latest
      
  - name: Start Apache
    service:
     name:  httpd
     state: started
     enabled: true

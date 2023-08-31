# Infrastructure

## Introduction

In this lab, you will build the infrastructure that we will use to run the rest of the workshop. You are going to use Terraform and Ansible.

Previous experience on Terraform or Ansible is not required. 

> Terraform is an Open Source tool to write code that represents resources on the Cloud. Running that code will create those resources on Oracle Cloud, the same way you can create resources, Terraform keeps track of everything you create and can be easily removed from the Cloud.<br>
> 
> <br>
>
> Ansible is an Open Source, command-line IT automation software application written in Python. It can configure systems, deploy software, and orchestrate advanced workflows to support application deployment, system updates, and more.

Estimated Lab Time: XX minutes

### Objectives

In this lab, you will create the infrastructure to complete this workshop on Oracle Cloud. You will create a Server to scale up and down and a tester to check the availability of the server and detect any downtime.

### Prerequisites

* An Oracle Free Tier, Paid or LiveLabs Cloud Account

## Task 1: Set up the environment

1. From the Oracle Cloud Console, click on **Cloud Shell**.

  ![xxx](images/xxx.png)

2. Clone the repository where all the terraform code is.

    ```bash
    <copy>git clone https://github.com/vmleon/oci-scale-compute-flex.git</copy>
    ```

  ![xxx](images/xxx.png)

3. Change to the new cloned folder.

    ```bash
    <copy>cd oci-scale-compute-flex</copy>
    ```

  ![xxx](images/xxx.png)

4. Install some dependencies needed for the scripts.

    ```bash
    <copy>cd scripts && npm install && cd ..</copy>
    ```

  ![xxx](images/xxx.png)

5. After a few seconds, you will see this message.

  ![xxx](images/xxx.png)

## Task 2: Create the Infrastructure

1. We need to create a `.env.json` file with all the setup for our testing environment. The file will be created with a script that will ask a few questions. Run it with the following command:

    ```bash
    <copy>npx zx scripts/setenv.mjs</copy>
    ```

2. The script will ask for the `Compartment name`, press _ENTER_ to deploy in the root compartment. If you have a specific compartment, type the name instead.

  ![xxx](./images/xxx.png)

3. Terraform needs a configuration file called `terraform.tfvars` that you are going to create by running the `tfvars.mjs` script.

    ```bash
    <copy>npx zx scripts/tfvars.mjs</copy>
    ```

4. During the execution of the script, it will ask for the compartment. You just type _**ENTER**_ to select the root compartment. If you are familiar with OCI compartments, then feel free to pick an existing compartment name.

  ![xxx](images/xxx.png)

5. From the **Cloud Shell**, run the following command to change to the terraform directory:

    ```bash
    <copy>cd terraform</copy>
    ```

6. Run the Terraform `init` to prepare Terraform.

    ```bash
    <copy>terraform init</copy>
    ```

7. Run the Terraform `apply` to create the infrastructure.

    ```bash
    <copy>terraform apply -auto-approve</copy>
    ```

8. Change the directory to the root.

    ```bash
    <copy>cd ..</copy>
    ```

## Task 3: Deploy the application and tester with Ansible

1. From the **Cloud Shell**, run the following command to change to the Ansible directory.

    ```bash
    <copy>cd ansible</copy>
    ```

2. Run the Ansible playbook to deploy the application and the performance test tool.

    ```bash
    <copy>ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ../terraform/generated/app.ini ./demo.yaml</copy>
    ```

3. Wait for all the steps to be executed.

  ![xxx](./images/xxx.png)

4. Change the directory to the root.

    ```bash
    <copy>cd ..</copy>
    ```

You may now [proceed to the next lab](#next).

## Acknowledgements

* **Author** - Priscila Iruela - Technology Product Strategy Director - EMEA
* **Author** - Victor Martin - Technology Product Strategy Director - EMEA
* **Last Updated By/Date** - October, 2023

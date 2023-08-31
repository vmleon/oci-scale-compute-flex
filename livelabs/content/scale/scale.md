# Scale

## Introduction

XXX

In this lab, you will build the infrastructure that we will use to run the rest of the workshop.

Previous experience on Terraform is not required. Nevertheless, Terraform is an Open Source tool to write code that represents resources on the Cloud. Running that code will create those resources on Oracle Cloud, the same way you can create resources, Terraform keeps track of everything you create and can be easily removed from the Cloud.

Estimated Lab Time: XX minutes

### Objectives

In this lab, you will create the infrastructure to complete this workshop on Oracle Cloud. You will create several Oracle Databases and Database Management entities.

### Prerequisites

* An Oracle Free Tier, Paid or LiveLabs Cloud Account

## Task 1: Run the test

1. From **Cloud Shell** change to the terraform directory.

    ```bash
    <copy>cd terraform</copy>
    ```
2. Print the Tester public IP.

    ```bash
    <copy>terraform output tester_public_ip</copy>
    ```

3. Ssh into the tester to run the performance test, when running the command, replace _**TESTER_PUBLIC_IP**_.

    ```bash
    <copy>ssh -i ~/.ssh/scalecompute opc@TESTER_PUBLIC_IP</copy>
    ```
  ![xxx](images/xxx.png)

1. Run the performance tool.

    ```bash
    <copy>k6 run -e SERVER_HOST=SERVER_PRIVATE_IP -e SERVER_PORT=3000 index.js</copy>
    ```

  ![xxx](images/xxx.png)

3. Go to Compute and reshape.

4. ...

You may now [proceed to the next lab](#next).

## Acknowledgements

* **Author** - Victor Martin - Technology Product Strategy Director - EMEA
* **Last Updated By/Date** - September, 2023

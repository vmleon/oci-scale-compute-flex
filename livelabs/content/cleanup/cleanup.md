# Clean Up (optional)

## Destroy Infrastructure

In this lab, you are going to destroy all the resources you have created on Oracle Cloud to make sure your tenancy is clean from everything done during this workshop.

![xxx](images/xxx.png)

Estimated Lab Time: 10 minutes

### Prerequisites

* An Oracle Free Tier, Paid or LiveLabs Cloud Account

## Task 1: Terraform destroy.

1. Make sure you are in the Terraform folder.

    ```
    <copy>cd ~/oci-scale-compute-flex/terraform</copy>
    ```

  ![xxx](images/xxx.png)

2. Run the `destroy` command on Terraform.

    ```
    <copy>terraform destroy -auto-approve</copy>
    ```

  ![xxx](images/xxx.png)

3. After a few minutes, you will see the message confirming terraform destroy completed.

  ![xxx](images/xxx.png)

4. Congratulations, you have finished the cleanup.

## Acknowledgements

* **Author** - Victor Martin - Technology Product Strategy Director - EMEA
* **Last Updated By/Date** - September, 2023

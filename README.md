
# Haui Food System Installation Guide

## Description

Haui Food is a food management system designed for Hanoi University of Industry. The system comprises multiple services and utilizes Docker for easy deployment. Below is a step-by-step guide to install and run the system on your machine.

## Installation Steps

### Step 1: Clone the Main Repository

First, clone the main setup repository of the system to your machine:

```bash

git clone https://github.com/haui-food/haui-food-setup.git

```

### Step 2: Create the .env File

After cloning the repository, navigate to the cloned directory and create a `.env` file based on the `.env.example` file:

```bash

cd haui-food-setup

cp .env.example .env

```

Edit the .env file to configure the environment variables suitable for your system.

### Step 3: Start Core Services

Start the core services like the database and RabbitMQ using Docker:

```bash

docker compose up -d

```

### Step 4: Clone All Necessary Repositories

Next, you need to clone all the necessary repositories for the system. Use the clone-organization.sh script provided in the main repository to do this:

```bash

sh clone-organization.sh

```

### Step 5: Install and Start Services from Each Repository

After downloading all necessary repositories, navigate to each repository and follow these steps:

1. Create a .env file based on the .env.example file in each repository:

```bash

cp .env.example .env

```

Edit the .env file to configure the environment variables suitable for your system.

2. Start the services in each repository using Docker:

```bash

docker compose up

```

Repeat these steps for all required repositories to complete the installation and start the Haui Food system.

## Conclusion

After completing the above steps, the Haui Food system will be installed and running on your machine. If you encounter any issues during the installation process, please contact the [development team](https://www.facebook.com/messages/t/274451679080721) for support.

Good luck 🍀

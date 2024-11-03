# Ansible-Nexus3-Config-as-Code

## Setting up local development and test environment
There are a few ways to get this project up & running locally.

### 1: Use the devcontainer
Using a devcontainer is the preferred approach to setup a dev/test environment for this project, for the following reasons:

1. **Consistency**: The devcontainer ensures that all developers are using the same development environment configuration.
2. **Isolation**: Dependencies and tools are isolated from your local system, preventing potential conflicts with other projects.
3. **Reproducibility**: The environment can be easily recreated, ensuring that the setup process is quick and reliable.
4. **Portability**: The devcontainer configuration can be shared across different projects, teams and environments. Making it easier to onboard new contributors.

To use the devcontainer, follow these steps:

1. Make sure you have Docker installed and running on your system.
2. Open the project in Visual Studio Code.
3. When prompted, reopen the project in the container.

Visual Studio Code will build the container based on the configuration in the `.devcontainer` folder and open the project inside the container.
If its the first time you're running the devcontainer, please wait a minute or two until the terminal has been reactivated. This will ensure you're using the Python virtual environment which contain all the tools you'll need.

### 2: Install dependencies directly on your system
Make sure you have at least python 3.10 available on your system.
On macOS you can simply run `brew install python3`, assuming you have Homebrew already up & running.

Once Python3.10 or higher is available, continue to create a virtual environment:
`python3 -m venv .venv-3.10`
If you have another python3 version, feel free to name the virtual environment accordingly, for example `python3 -m venv .venv-3.13`.
Once the virtual environment is created, activate it with the following command:
`source .venv-3.10/bin/activate`

# Ansible-Nexus3-Pro

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

## Enabling Nexus Pro

To enable Nexus Pro features during development, you'll have to bring your own license.
The molecule prepare playbook will look for the environment variable `NEXUS_LICENSE_B64` on the host. i.e your development environment. This may be a GitHub Codespace or your system environment variable.

To base64 encode your Nexus Pro license file and set it as an environment variable, follow these steps:

1. **Encode the file**: Use the following command to encode your license file:
    ```sh
    base64 path/to/your/nexus-license.lic > encoded-license.txt
    ```
    Replace `path/to/your/nexus-license.lic` with the actual path to your Nexus Pro license file.

2. **Set the environment variable**: Copy the contents of `encoded-license.txt` and set it as an environment variable:
    ```sh
    export NEXUS_LICENSE_B64=$(cat encoded-license.txt)
    ```

Now, the `NEXUS_LICENSE_B64` environment variable contains your base64 encoded license, which will be detected by the molecule to enable the pro features.
If you provide an invalid license Nexus will ignore it and start as the OSS version.

If working with an environment variable is not an option, you can provide the base64 encoded license using an Ansible variable: `nexus_license_b64: "your-base64-encoded-license-string"`

## Using S3 object sorage

default username:password
minioadmin:minioadmin

user: nexus-user
password; nexus-password

--access-key nexus-access-key
--secret-key nexus-secret-key
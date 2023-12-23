# Laravel - Nginx docker

### Requirement
1. Docker and git installed

<details>
    <summary>How to run</summary>

1. Clone this repository
    ```zsh
    git clone --recursive https://github.com/dodyirawan85/laravel-docker.git
    ```
3. Change directory
   ```zsh
   cd laravel-docker
   ```
2. Build base webserver
    ```zsh
    docker build -t base-laravel:latest base/.
    ```
3. Change the database password in compose.yaml and configs/laravel/env
4. Build the container
    ```zsh
    docker compose up -d
    ```
